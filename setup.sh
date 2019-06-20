#!/bin/bash

SCRIPTPATH="$(realpath "$(dirname "$0")")"

# build image
docker build -t docker-puppet-dev "$SCRIPTPATH"
