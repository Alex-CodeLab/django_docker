#!/bin/bash

docker-compose run web django-admin startproject config .

sudo chown -R $USER:$USER .

mkdir -p assets/js
mkdir assets/img
mkdir assets/sass
touch assets/js/main.js
touch assets/sass/main.sass

# docker-compose build web
docker-compose up -d --build
