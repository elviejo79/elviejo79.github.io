#!/usr/bin/env -S nu --stdin

# Get the git creation date for a file or directory
def get-git-date [path: string] {
    let result = (git log --diff-filter=A --follow --format=%aI -- $path
                  | lines
                  | last)

    if ($result | is-empty) {
        return null
    }

    # Convert ISO date to YY-MMM-DD format (e.g., 26-mar-07)
    let date = ($result | into datetime)
    let year = ($date | format date "%y")
    let month = ($date | format date "%b" | str downcase)
    let day = ($date | format date "%d")

    $"($year)-($month)-($day)"
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
            # Contents is a list
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
            # Contents is a record (single item)
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

    # Output to stdout
    $updated_data | to json --indent 2
}
