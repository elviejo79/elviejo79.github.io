#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cat ../ibis_maps/lord_of_the_rings.yaml| \
    jfq --accept-yaml --query-file ./ibis_to_array_of_objects.jsonata  |\
    jfq --query-file ./array_of_objecs_to_visjs.jsonata | \
    cat <(echo -n "var data=") - <(echo ";") > ibis_for_visjs.js
