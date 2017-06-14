#!/bin/bash -e

function abspath() {
  echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
}

SETTINGS_FILE="`dirname $0`/settings"
if [ ! -f "$SETTINGS_FILE" ]; then
  echo "ERROR: copy settings.example to settings and customize it!"
  exit 1
fi

source $SETTINGS_FILE

USER_VOLUME=""
for var in "${DOCKER_VOLUME[@]}"
do
  if grep -q \\: <<< $var; then
    USER_VOLUME="$USER_VOLUME -v $var"
  else
    USER_VOLUME="$USER_VOLUME -v $var:$var"
  fi
done

$DOCKER_REQUIRE_SUDO docker run --rm -it --privileged \
  $USER_VOLUME \
  -e XDG_RUNTIME_DIR=/tmp \
  -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
  -e HOME="$HOME" \
  -e USER_NAME="$USER" \
  -e USER_UID=$USER_UID \
  -e USER_GID=$USER_GID \
  -w "$(abspath `pwd`)" \
  -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
  -v /run/user/$USER_UID/pulse:/run/pulse:ro \
  docker.io/exaile/gst-python:$IMAGE_VERSION $ENTRYPOINT "$@"