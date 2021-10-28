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
export DATABASE_DEFAULT_NAME=dev-db
export DATABASE_DEFAULT_USER=postgres
export DATABASE_DEFAULT_PASSWORD=Passw0rd!
export DATABASE_DEFAULT_HOST=172.17.0.2
export DATABASE_DEFAULT_PORT=5432

docker run \
    -d --name $DATABASE_DEFAULT_NAME \
    -e POSTGRES_PASSWORD=$DATABASE_DEFAULT_PASSWORD \
    -v ${HOME}/postgres-data/:/var/lib/postgresql/data \
    -p $DATABASE_DEFAULT_PORT:$DATABASE_DEFAULT_PORT \
        $DATABASE_DEFAULT_USER

docker run \
    -p 80:80 \
    -e 'PGADMIN_DEFAULT_EMAIL=admin@test.local' \
    -e 'PGADMIN_DEFAULT_PASSWORD=Passw0rd!' \
    --name pgadmin-dev \
    -d dpage/pgadmin4

```

When the containers are up and running, you can get the IPAdress of your postgresql server with the following command.
Use it to connect with your local DB in pgadmin.

```sh
docker inspect <db-name> -f "{{json .NetworkSettings.Networks }}"
```

## MongoDB (no-sql document)

## Redis (in-memory)
