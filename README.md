Personal Blog of Alejandro Garcia agaciafdz@gmail.com

Developed with emacs org-mode
or with markdeep.
Depending on the article

In Nushell to generate this book:

``` nu
$ tree -I '????-??-??-*' --timefmt '%y-%b-%d' -L 3 --sort mtime -r -J --noreport --info |
  jfq --query-file ./filter-tree-command-append-info.jsonata |
  tee { mustache ./index.mustache | save --force index.html } |
  mustache ./rss.mustache | save --force rss.xml
```

This is the command I use to set the dates of some articles.
Will need to change to take the information out of git
but in the mean time is ok to use the time from the filesystem

``` nu
ls | select name | where name =~ '^\d{4}-\d{2}-\d{2}-' | each { |row|
             let date = ($row.name | str substring 0..9)
             let new_name = ($row.name | str substring 11.. | str title-case | str downcase |
        str capitalize)
             $"touch --date ($date)  `./writes/($new_name)/index.html`"
            } | table --index false --theme none
```
