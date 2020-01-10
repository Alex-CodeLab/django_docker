#!/bin/bash

docker-compose run web django-admin startproject config .

sudo chown -R $USER:$USER .

mkdir -p assets/js
mkdir assets/img
mkdir assets/scss
touch assets/js/main.js
touch assets/scss/main.scss

# docker-compose build web
docker-compose up -d --build
