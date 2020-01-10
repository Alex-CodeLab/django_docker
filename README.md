

install:

     ./install.sh


Configure settings:
replace `config/settings.py` with the example `settings.example.py`

finish:

    docker-compose run web ./manage.py migrate
    docker-compose run web ./manage.py createsuperuser
    docker-compose run web ./manage.py startapp myapp
    docker-compose up

Build assets:
    cd asssets
    npm run dev

check database:

    docker-compose exec db psql --username=hello_django --dbname=hello_django_dev

check volume:

    docker volume inspect django-on-docker_postgres_data


----------
https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/
https://medium.com/@fceruti/setting-up-a-django-project-like-a-pro-a847a9867f9d
