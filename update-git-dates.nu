#!/usr/bin/env -S nu --stdin

def get-git-date [path: string] {
    if ($path | str starts-with "writes/") {
        let article = ($path | str replace "writes/" "" | str replace "/index.html" "")
        let norm = ($article | str downcase | str replace --all ' ' '-' | str replace --all '_' '-')
        let stripped = ($norm | str replace --all '-' '')

        let match = (ls | where type == dir | get name
                        | where {|n| $n =~ '^\d{4}-\d{2}-\d{2}-'}
                        | where {|d|
                            let slug = ($d | str replace -r '^\d{4}-\d{2}-\d{2}-' '' | str downcase | str replace --all '_' '-')
                            $slug == $norm or ($slug | str replace --all '-' '') == $stripped
                        })
        if not ($match | is-empty) {
            let p = ($match | first | parse '{y}-{m}-{d}-{rest}' | first)
            return $"($p.y)-($p.m)-($p.d)"
        }
    }

    let lines = (git log --diff-filter=A --follow --format=%aI -- $path | lines)
    if ($lines | is-empty) { return null }
    $lines | last | into datetime | format date "%Y-%m-%d"
}

def update-times [node: record, base_path: string] {
    let full_path = if ("name" in $node) {
        if ($base_path | is-empty) { $node.name } else { $"($base_path)/($node.name)" }
    } else { $base_path }

    mut updated = $node

    if ("name" in $node) {
        let iso = (get-git-date $"($full_path)/index.html")
        if ($iso != null) {
            $updated = ($updated
                | upsert time ($iso | into datetime | format date "%y-%b-%d" | str downcase)
                | upsert _sort_date $iso)
        }
    }

    if ("contents" in $node) {
        let new_contents = if ($node.contents | describe | str starts-with "record") {
            update-times $node.contents $full_path
        } else {
            $node.contents | each {|item| update-times $item $full_path }
        }
        $updated = ($updated | upsert contents $new_contents)
    }

    $updated
}

def main [] {
    let input = ($in | from json)
    mut out = {}
    for key in ($input | columns) {
        mut section = (update-times ($input | get $key) "")
        if ($key == "writes" and "contents" in $section) {
            $section = ($section | upsert contents (
                $section.contents
                | default "" _sort_date
                | sort-by _sort_date --reverse
                | each {|i| $i | reject --ignore-errors _sort_date }
            ))
        }
        $out = ($out | insert $key $section)
    }
    $out | to json --indent 2
}
