#!/usr/bin/env -S nu --stdin

# Find a date-prefixed directory in the repo root that matches the article name
def get-date-from-dir-prefix [article_name: string] {
    let normalized = ($article_name | str downcase | str replace --all ' ' '-' | str replace --all '_' '-')
    # stripped version removes all non-alphanumeric chars for CamelCase and double-dash edge cases
    let stripped = ($normalized | str replace --all '-' '' | str replace --all '_' '')

    let match = (ls | where type == dir
                    | get name
                    | where {|n| $n =~ '^\d{4}-\d{2}-\d{2}-'}
                    | where {|dir|
                        let slug = ($dir | str replace -r '^\d{4}-\d{2}-\d{2}-' '' | str downcase | str replace --all '_' '-')
                        let slug_stripped = ($slug | str replace --all '-' '' | str replace --all '_' '')
                        $slug == $normalized or $slug_stripped == $stripped
                    }
                    )

    if ($match | is-empty) {
        return null
    }

    let parsed = ($match | first | parse '{y}-{m}-{d}-{rest}' | first)
    $"($parsed.y)-($parsed.m)-($parsed.d)" | into datetime | format date "%y-%b-%d" | str downcase
}

# Get the git creation date for a file or directory
def get-git-date [path: string] {
    # For articles under writes/, try matching a date-prefixed directory first
    if ($path | str starts-with "writes/") {
        let article_name = ($path | str replace "writes/" "" | str replace "/index.html" "")
        let dir_date = (get-date-from-dir-prefix $article_name)
        if ($dir_date != null) {
            return $dir_date
        }
    }

    let log_lines = (git log --diff-filter=A --follow --format=%aI -- $path | lines)

    if ($log_lines | is-empty) {
        return null
    }

    let result = ($log_lines | last)

    if ($result | is-empty) {
        return null
    }

    $result | into datetime | format date "%y-%b-%d" | str downcase
}

# Recursively update time fields in the JSON structure
def update-times [node: record, base_path: string] {
    mut updated = $node

    # Update time for current node if it's a directory or file with a name
    if ("name" in $node) {
        let full_path = if ($base_path | is-empty) {
            $node.name
        } else {
            $"($base_path)/($node.name)"
        }

        let index_path = $"($full_path)/index.html"
        print --stderr $"Checking: ($index_path)"
        let git_date = (get-git-date $index_path)

        if ($git_date != null) {
            print --stderr $"  Found date: ($git_date)"
            $updated = ($updated | upsert time $git_date)
        } else {
            print --stderr $"  No git history found"
        }
    }

    # Recursively process contents
    if ("contents" in $node) {
        let contents = $node.contents

        let contents_type = ($contents | describe)
        if ($contents_type | str starts-with "list") or ($contents_type | str starts-with "table") {
            let new_contents = ($contents | each {|item|
                let item_path = if ($base_path | is-empty) {
                    $node.name
                } else {
                    $"($base_path)/($node.name)"
                }
                update-times $item $item_path
            })
            $updated = ($updated | upsert contents $new_contents)
        } else if ($contents | describe | str starts-with "record") {
            let item_path = if ($base_path | is-empty) {
                $node.name
            } else {
                $"($base_path)/($node.name)"
            }
            let new_contents = (update-times $contents $item_path)
            $updated = ($updated | upsert contents $new_contents)
        }
    }

    $updated
}

# Main function
def main [] {
    let input_data = ($in | from json)

    mut updated_data = {}
    for key in ($input_data | columns) {
        let value = ($input_data | get $key)
        print --stderr $"\nProcessing section: ($key)"
        $updated_data = ($updated_data | insert $key (update-times $value ""))
    }

    $updated_data | to json --indent 2
}
