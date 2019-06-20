#!/bin/bash

SCRIPTPATH="$(dirname "$0")"
# install dependencies
for metadata in "$SCRIPTPATH"/../modules/*/metadata.json; do
  while read -r NAME VERSION; do
    # get minimum version
    VERSION="$(echo "$VERSION" | grep -Po "\d+\.\d+\.\d+" | LANG=c sort -V | head -1)"
    # replace slash with minus
    NAME="${NAME//\//-}"
    /opt/puppetlabs/bin/puppet module install --modulepath "$SCRIPTPATH"/../modules/ --version "$VERSION" "$NAME"
  done< <(<"$metadata" jq -r '.dependencies[] | "\(.name) \(.version_requirement)"')
done

/opt/puppetlabs/bin/puppet apply --debug --modulepath "$SCRIPTPATH"/../modules/ "$SCRIPTPATH"/../site.pp
