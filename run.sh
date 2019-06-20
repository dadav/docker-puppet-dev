#!/bin/bash

# build image
docker build -t docker-puppet-dev .

# start container
docker run docker-puppet-dev
