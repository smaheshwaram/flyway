# Postgres Database (Docker)

## Description
This docker compose will use Flyway to version the database.  The database is a postgres
database docker image.  

## Add sql changes
Please follow these [naming conventions](https://flywaydb.org/documentation/migrations#naming-1) on your file.
Put the files under ``./flyway/sql`` and then run the docker compose.

## Links
* https://hub.docker.com/_/postgres/
* https://flywaydb.org/
* https://github.com/flyway/flyway-docker
* https://hub.docker.com/r/boxfuse/flyway/
* https://hub.docker.com/_/adminer/

## Environment Variables used
| VARIABLE | DESCRIPTION |
| :--- | :---| 
| CI_REGISTRY_USER | User to log in with |
| CI_REGISTRY_PASSWORD | Password to log in with |
| CI_REGISTRY | URL to private Docker Repository that you are logging into |
| CI_PROJECT_PATH | URL to the project directory in Gitlab | 
| DB_VERSION | label/version of the Docker artifact |


## How to run the build
Follow gitlab-ci.yml file

However, if you want to build locally, set the appropriate variables

````
docker login -u "$CI_REGISTRY_USER"  -p "$CI_REGISTRY_PASSWORD" $CI_REGISTRY
docker-compose --file ./db-postgres-build.yml up -d db
docker-compose --file ./db-postgres-build.yml up flyway
docker-compose --file ./db-postgres-build.yml build project_db
docker push $CI_REGISTRY/$CI_PROJECT_PATH/project_db-postgres:DB_VERSION
````

## Adminer
To use Adminer open a web browser on the local machine the docker images are running on
and type in [http://localhost:8080](http://localhost:8080).

for the following
* System *postgresSQL*
* url *db*
* usename *username* 
* password *password*
* database *db name*

Once logged in select the *schema name* schema

## Flyway Maven Plugin
Used to migrate your schema with the flyway/sql scripts as an alternative to using Docker.
If the schema name database already exists at the specified location, use 
````
mvn flyway:clean
````
 If the only change to the scripts library is that a new one has been added, 
the migrate command will catch your database up, no need to clean first.
````$xslt
mvn flyway:migrate
````
