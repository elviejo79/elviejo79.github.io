Personal Blog of Alejandro Garcia agaciafdz@gmail.com

Developed with emacs org-mode
or with markdeep.
Depending on the article

In Nushell to generate this book:

``` nu
 tree -I '????-??-??-*' --timefmt "%y-%b-%d" -L 3 --sort mtime -r -J --noreport --info |
 jfq --query-file ./filter-tree-command-append-info.jsonata  |
 mustache ./index_template.mustache |
 save --force index.html

```
