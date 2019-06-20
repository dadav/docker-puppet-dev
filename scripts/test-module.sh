#!/bin/bash

SCRIPTPATH="$(dirname "$0")"
/opt/puppetlabs/bin/puppet apply --modulepath "$SCRIPTPATH"/../modules/ "$SCRIPTPATH"/../site.pp
