#!/bin/bash

if [ ! -d .git ]; then
  git init
fi

exec "$@"
