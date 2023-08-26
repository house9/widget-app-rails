#!/usr/bin/env bash
# exit on error
set -ox errexit

docker-compose up -d

cd server && bundle && cd ..
cd server && bundle exec rake db:create db:migrate db:seed && cd ..
cd client && npm install && cd ..
