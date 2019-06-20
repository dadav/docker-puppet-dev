#!/bin/bash

[[ "$#" -ne 2 ]] && echo "Usage: run.sh <modulepath> <manifest>" && exit 1

MODULEPATH="$1"
MANIFEST="$2"

# run container
docker run -v "$MANIFEST":/puppet/site.pp -v "$MODULEPATH":/puppet/modules/"$(basename "$MODULEPATH")" docker-puppet-dev
