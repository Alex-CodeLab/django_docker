#!/bin/bash

docker-compose run web django-admin startproject config .

sudo chown -R $USER:$USER .


# docker-compose build web
docker-compose up -d --build
