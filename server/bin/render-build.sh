#!/usr/bin/env bash
# exit on error
set -o errexit

node -v
ruby -v
echo $RAILS_ENV

# rails build
bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean

# client build
rm -fr client/dist/
cd ../client
npm install
npm run build
cd ..
mkdir -p server/public/build server/public/static
mv client/dist/index.html server/public/build/index.html
mv client/dist/static/* server/public/static

# run database migrations
cd server
bundle exec rake db:migrate
