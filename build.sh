#!/bin/bash

cd `dirname $0`
docker build --rm -t exaile/gst-python .