#!/bin/bash

if [ ! -d .git ]; then
  git init
fi

if [ ${GOLLUM_AUTHOR_USERNAME:+1} ]; then
	git config user.name "${GOLLUM_AUTHOR_USERNAME}"
fi
if [ ${GOLLUM_AUTHOR_EMAIL:+1} ]; then
	git config user.email "${GOLLUM_AUTHOR_EMAIL}"
fi

OPTIONS=
if [ "x$NO_EDIT" != "x" ]; then
  OPTIONS="$OPTIONS --no-edit"
fi

if [ -f /config.rb ]; then
  OPTIONS="$OPTIONS --config /config.rb"
fi

exec gollum --port=80 --adapter=rugged $OPTIONS "$@"
