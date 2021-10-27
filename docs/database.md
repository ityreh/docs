# Setup local development environment databases

Use docker to setup a local development environment with databases.

## PostgreSQL (relational)

First you have to pull the docker images and create a directory for the test data.

```sh
docker pull postgresql pgadmin
mkdir ${home}/postgres-data
```

Copy the setup to a script e.g. in a bin folder in your project `bin/setup-local-test.sh`.

```sh
#!/bin/sh

# Database
export DATABASE_DEFAULT_NAME=ecom-dev-db
export DATABASE_DEFAULT_USER=postgres
export DATABASE_DEFAULT_PASSWORD=Passw0rd!
export DATABASE_DEFAULT_HOST=localhost
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

## MongoDB (no-sql document)

## Redis (in-memory)
