Moodle for Docker
===============
Dockerfiles to ease installation of various Moodle configurations.

## Building

###PHP5.4 + Moodle
`docker build -t bencroskery/moodle:php54 -f DockerFile54 .`

###PHP7 + Moodle
`docker build -t bencroskery/moodle:php7 -f DockerFile7 .`

###PHP5.4 + Oracle Client + Moodle
`docker build -t bencroskery/moodle:php54o -f DockerFile54Oracle .`

###Oracle + Moodle
`docker build -t bencroskery/moodle:oracle oracle`

## Running

Start a database (MYSQL/POSTGRES) and link it to any of the PHP Moodle containers.
For Oracle use the provided Oracle container with the PHP5.4 + Oracle Client.

Examples below:

```
docker run -d --name a-mysql -e MYSQL_ROOT_PASSWORD=password -d mysql
docker run -d --link a-mysql:mysql -p 80:80 --name my-moodle bencroskery/moodle:php7

# Moodle config
# -------------
#   host: mysql
#   name: moodle (can be changed)
#   user: root
#   password: password
```
```
docker run -d --name a-postgres -e POSTGRESS_PASSWORD=password -d postgres
docker run -d --link a-postgres:postgres -p 80:80 --name my-moodle bencroskery/moodle:php54

# Moodle config
# -------------
#   host: postgres
#   name: postgres
#   user: postgres
#   password: password
```
```
docker run -d --name a-oracle --shm-size=1g bencroskery/moodle:oracle
docker run -d --link a-oracle:oracle -p 80:80 --name my-moodle bencroskery/moodle:php54o
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

Change the Oracle DB password using `docker exec a-oracle ./setPassword.sh password`.
