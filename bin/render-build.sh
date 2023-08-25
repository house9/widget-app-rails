#!/usr/bin/env bash
# exit on error
set -o errexit

ruby -v
echo $RAILS_ENV

# rails build
bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean

# client build
rm -fr client/dist/
cd client
npm install
npm run build
cd ..
mkdir -p public/build public/static
mv client/dist/index.html public/build/index.html
mv client/dist/static/* public/static

# run database migrations
bundle exec rake db:migrate
