#!/bin/bash

SCRIPTPATH="$(dirname "$0")"
# install dependencies
for metadata in "$SCRIPTPATH"/../modules/*/metadata.json; do
  NAME="$(<"$metadata" jq -r ".dependencies[].name")"
  VERSION="$(<"$metadata" jq -r ".dependencies[].version_requirement")"
  # strip when "<" requirement
  VERSION="${VERSION%<*}"
  # remove whitespace
  VERSION="${VERSION// /}"
  NAME="${NAME//\//-}"
  /opt/puppetlabs/bin/puppet module install --debug --modulepath "$SCRIPTPATH"/../modules/ "$NAME"
done
/opt/puppetlabs/bin/puppet apply --debug --modulepath "$SCRIPTPATH"/../modules/ "$SCRIPTPATH"/../site.pp
