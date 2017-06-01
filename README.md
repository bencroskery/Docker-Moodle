Moodle for Docker
===============
Dockerfiles to ease installation of various Moodle configurations.

## Building

Build any of the available containers from the root folder with the following commands:

### PHP5.4 + Moodle
`docker build -t bencroskery/moodle:php54 php54`

### PHP7 + Moodle
`docker build -t bencroskery/moodle:php7 php7`

### PHP5.4 + Oracle Client + Moodle
`docker build -t bencroskery/moodle:php54o php54o`

### Oracle + Moodle
`docker build -t bencroskery/moodle:oracle oracle`

## Running

Start a database (MySQL/PostgreSQL) and link it to any of the PHP Moodle containers.
For Oracle use the provided Oracle container with the PHP5.4 + Oracle Client.

* make sure to connect port 80 to a local port with `-p 8080:80`
* to pull the latest Moodle from git add `-e INSTALL=true`
* run `docker exec my-moodle pullMoodle.sh` once the server has started to wipe the docroot and pull the latest Moodle
* consider linking the docroot to a local folder using `-v \local\folder:\var\www\html`
* change the Oracle DB password using `docker exec a-oracle ./setPassword.sh password`
* SSH into any of the machines using `docker exec -it my-moodle /bin/bash`

Examples below:

### PHP7 + MySQL with Moodle Install
```
docker run -d --name a-mysql -e MYSQL_ROOT_PASSWORD=password -d mysql
docker run -d --link a-mysql:mysql -p 8080:80 -e INSTALL=true --name my-moodle bencroskery/moodle:php7

# Moodle config
# -------------
#   host: mysql
#   name: moodle (can be changed)
#   user: root
#   password: password
```

### PHP5.4 + PostgreSQL with Volume Mount
```
docker run -d --name a-postgres -e POSTGRESS_PASSWORD=password -d postgres
docker run -d --link a-postgres:postgres -p 8080:80 -v \local\folder:\var\www\html --name my-moodle bencroskery/moodle:php54

# Moodle config
# -------------
#   host: postgres
#   name: postgres
#   user: postgres
#   password: password
```
### PHP5.4 + Oracle
```
docker run -d --name a-oracle --shm-size=1g bencroskery/moodle:oracle
docker run -d --link a-oracle:oracle -p 8080:80 --name my-moodle bencroskery/moodle:php54o
# Wait a few minutes for oracle to start up
docker exec a-oracle ./setMoodle.sh

# Moodle config
# -------------
#   host: oracle
#   name: xe
#   user: system
#   password: password
#   port: 1521
```
## Extras
SSH into any of the machines using `docker exec -it <container> /bin/bash`

Change the Oracle DB password using `docker exec a-oracle ./setPassword.sh password`

## More Docs

Read more information about the DB's on the [MySQL](https://hub.docker.com/_/mysql/), [PostgreSQL](https://hub.docker.com/_/postgres/), [Oracle](https://github.com/oracle/docker-images/tree/master/OracleDatabase).
