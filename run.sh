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
  -e DISPLAY="$DISPLAY" \
  -e HOME="$HOME" \
  -e USER_NAME="$USER" \
  -e USER_UID=$USER_UID \
  -e USER_GID=$USER_GID \
  -w "$(abspath `pwd`)" \
  --privileged \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -v /run/user/$USER_UID/pulse:/run/pulse:ro \
  exaile/gst-python $ENTRYPOINT "$@"