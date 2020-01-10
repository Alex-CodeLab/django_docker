

install:
     
     ./install.sh


configure:
replace in config/settings.py :

      SECRET_KEY = os.environ.get("SECRET_KEY")
      DEBUG = int(os.environ.get("DEBUG", default=0))
      ALLOWED_HOSTS = os.environ.get("DJANGO_ALLOWED_HOSTS").split(" ")
      DATABASES = {
          "default": {
              "ENGINE": os.environ.get("SQL_ENGINE", "django.db.backends.sqlite3"),
              "NAME": os.environ.get("SQL_DATABASE", os.path.join(BASE_DIR, "db.sqlite3")),
              "USER": os.environ.get("SQL_USER", "user"),
              "PASSWORD": os.environ.get("SQL_PASSWORD", "password"),
              "HOST": os.environ.get("SQL_HOST", "localhost"),
              "PORT": os.environ.get("SQL_PORT", "5432"),
          }
      }


finish:

    docker-compose run web ./manage.py migrate
    docker-compose run web ./manage.py createsuperuser
    docker-compose run web ./manage.py startapp myapp
    docker-compose up


check database:

    docker-compose exec db psql --username=hello_django --dbname=hello_django_dev

check volume:

    docker volume inspect django-on-docker_postgres_data


----------
https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/
