# Setup local development environment databases

Use docker to setup a local development environment with databases.

## PostgreSQL (relational)

First you have to pull the docker images and create a directory for the test data.

```sh
docker pull postgresql pgadmin
mkdir ${home}/postgres-data
```

Copy the setup to a script e.g. in a bin folder in your project `bin/setup-local-test.sh` or if you are in a Python project the perfect place is the postactivate script of the virtualenv.

```sh
#!/bin/sh

# Database
export DATABASE_DEFAULT_NAME=ecom-dev-db
export DATABASE_DEFAULT_USER=postgres
export DATABASE_DEFAULT_PASSWORD=Start123!
export DATABASE_DEFAULT_HOST=localhost
export DATABASE_DEFAULT_PORT=5432


postgres_container=$( docker ps -aqf name=ecom-dev-db )
postgres_container_running=$( docker inspect --format="{{.State.Running}}" ecom-dev-db )

if $postgres_container_running; then
  echo "Container postgres is running: $postgres_container"
elif [[ -n "$postgres_container" ]]; then
  echo "Container postgres is stopped, starting container."
  docker start $postgres_container
else
  echo "Container postgres not exists, creating new container."
  docker run -d \
    --name $DATABASE_DEFAULT_NAME \
    -e POSTGRES_PASSWORD=$DATABASE_DEFAULT_PASSWORD \
    -v ${HOME}/postgres-data/:/var/lib/postgresql/data \
    -p $DATABASE_DEFAULT_PORT:$DATABASE_DEFAULT_PORT \
    $DATABASE_DEFAULT_USER
fi

pgadmin_container=$( docker ps -aqf name=pgadmin-dev )
pgadmin_container_running=$( docker inspect --format="{{.State.Running}}" pgadmin-dev )

if $pgadmin_container_running; then
  echo "Container pgadmin is running: $pgadmin_container"
elif [[ -n "$pgadmin_container" ]]; then
  echo "Container pgadmin is stopped, starting container."
  docker start $pgadmin_container
else
  echo "Container pgadmin not exists, creating new container."
  docker run \
    -p 80:80 \
    -e 'PGADMIN_DEFAULT_EMAIL=admin@test.local' \
    -e 'PGADMIN_DEFAULT_PASSWORD=Passw0rd!' \
    --name pgadmin-dev \
    -d dpage/pgadmin4
fi

```

When the containers are up and running, you can get the IPAdress of your postgresql server with the following command.
Use it to connect with your local DB in pgadmin.

```sh
docker inspect <db-name> -f "{{json .NetworkSettings.Networks }}"
```

## MongoDB (no-sql document)

## Redis (in-memory)
