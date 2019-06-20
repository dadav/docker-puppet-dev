#!/bin/bash

SCRIPTPATH="$(dirname "$0")"
/opt/puppetlabs/bin/puppet apply --modulepath "$SCRIPTPATH"/../modules/ --hiera_config "$SCRIPTPATH"/../hiera.yaml "$SCRIPTPATH"/../site.pp
