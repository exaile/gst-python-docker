#!/bin/bash -e

cd `dirname $0`

TOBUILD=${1:-debian9 debian10 fedora28 fedora29 ubuntu18.04 ubuntu19.04}
BASE=docker.io/exaile/gst-python

for i in ${TOBUILD}; do
    echo "Building $BASE:$i"
    docker build --rm -t $BASE:$i -f Dockerfile.$i .
done
