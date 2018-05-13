#!/bin/sh

echo " ---> Fetching gems for ${ENV}..."

if [ "$ENV" = "production" ];
then
  bundle install --deployment --path=vendor/cache
else
  bundle install --with development:test --path=vendor/cache
fi
