#!/bin/bash

SCRIPTPATH="$(dirname "$0")"
puppet apply --modulepath "$SCRIPTPATH"/../modules/ --hiera_data "$SCRIPTPATH"/../hiera.yaml "$SCRIPTPATH"/../site.pp
