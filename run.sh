#!/bin/bash

# build image
docker build -t docker-puppet-dev .\
&& docker run docker-puppet-dev
