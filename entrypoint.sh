#!/bin/bash

if [ ! -d .git ]; then
  git init
fi

OPTIONS=
if [ "x$PLANTUML_URL" != "x" ]; then
  OPTIONS="--plantuml-url $PLANTUML_URL"
fi
if [ "x$NO_EDIT" != "x" ]; then
  OPTIONS="--no-edit"
fi

exec gollum --port=80 --adapter=rugged $OPTIONS "$@"
