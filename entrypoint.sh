#!/bin/bash

if [ ! -d .git ]; then
  git init
fi

exec gollum --port=80 --adapter=rugged "$@"
