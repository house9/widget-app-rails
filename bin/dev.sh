#!/usr/bin/env bash
# exit on error
set -o errexit

docker-compose up -d

overmind start -f Procfile.dev
