#!/bin/bash

docker-compose run web django-admin startproject config .

sudo chown -R $USER:$USER .

if [ -d "logs" ]; then
  mkdir logs
fi

rm config/settings.py
mv settings.example.py config/settings.py

# docker-compose build web
docker-compose up -d --build
