#!/usr/bin/env bash
# exit on error
set -o errexit

ruby -v
echo $RAILS_ENV

bundle exec rake db:seed
