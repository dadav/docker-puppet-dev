#!/bin/bash

SCRIPTPATH="$(dirname "$0")"
# install dependencies
for metadata in "$SCRIPTPATH"/../modules/*/metadata.json; do
  NAME="$(<"$metadata" jq -r ".dependencies[].name")"
  VERSION="$(<"$metadata" jq -r ".dependencies[].version_requirement")"
  # strip
  VERSION="${VERSION%<*}" # < sign
  VERSION="${VERSION//>/}" # > sign
  VERSION="${VERSION//=/}" # equal sign
  VERSION="${VERSION// /}" # whitespace

  NAME="${NAME//\//-}"
  /opt/puppetlabs/bin/puppet module install --debug --modulepath "$SCRIPTPATH"/../modules/ --version "$VERSION" "$NAME"
done
/opt/puppetlabs/bin/puppet apply --debug --modulepath "$SCRIPTPATH"/../modules/ "$SCRIPTPATH"/../site.pp
