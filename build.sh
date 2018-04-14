#!/bin/bash -e

cd `dirname $0`

TOBUILD=${1:-debian8 debian9 fedora27 fedora28 ubuntu16.04 ubuntu17.10}
BASE=docker.io/exaile/gst-python

for i in ${TOBUILD}; do
    echo "Building $BASE:$i"
    docker build --rm -t $BASE:$i -f Dockerfile.$i .
done
