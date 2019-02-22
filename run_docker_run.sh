#!/usr/bin/env bash

APP_NAME="app_name"

if [ ! -d "laradock_$APP_NAME" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  git submodule add -f https://github.com/Laradock/laradock.git laradock_$APP_NAME
  cp .env.laradock ./laradock_$APP_NAME/.env
  cp docker-compose-laradock.yml ./laradock_$APP_NAME/docker-compose.yml
fi

cd laradock_$APP_NAME

docker-compose up
docker-compose exec workspace composer install
docker-compose exec workspace php artisan migrate
