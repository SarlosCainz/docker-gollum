#!/bin/bash

if [ ! -d .git ]; then
  git init
fi

OPTIONS=
if [ "x$PLANTUML_URL" != "x" ]; then
  OPTIONS="--plantuml-url $PLANTUML_URL"
fi

exec gollum --port=80 --adapter=rugged $OPTIONS "$@"
