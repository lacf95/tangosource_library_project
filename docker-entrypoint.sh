#!/bin/bash
set -e

mix deps.get

(cd ./assets && npm install)

exec $@
