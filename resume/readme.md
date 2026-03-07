# How to generate my markdeep resume from a json resume

```
$ jfq --query-file ./format_dates_generic.jsonata ./resume.json | mustache ./json-resume-to-markdeep.mustache | save --force ./index.html
```
