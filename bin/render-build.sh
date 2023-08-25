#!/usr/bin/env bash
# exit on error
set -o errexit

ruby -v
echo $RAILS_ENV

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
