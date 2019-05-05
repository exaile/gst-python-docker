#!/bin/bash -e

cd `dirname $0`

TOBUILD=${1:-debian9 debian10 fedora31 ubuntu18.04 ubuntu19.10 \
	debian9-python3 debian10-python3 fedora31-python3 \
	ubuntu18.04-python3 ubuntu19.10-python3}
BASE=docker.io/exaile/gst-python

for i in ${TOBUILD}; do
    echo "Building $BASE:$i"
    docker build --rm -t $BASE:$i -f Dockerfile.$i .
done
