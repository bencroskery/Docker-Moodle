FROM ubuntu:xenial
MAINTAINER Ben Croskery <ben@irtech.com>
LABEL Description="PHP 7 + Moodle." \
	License="Apache License 2.0" \
	Usage="docker run -d -p [HOST PORT NUMBER]:80 -v [HOST WWW DOCUMENT ROOT]:/var/www/html bencroskery/moodle:php7" \
	Version="1.0"

RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y \
	libapache2-mod-php \
	php \
	php-common \
	php-mysql \
	php-pgsql \
	php-gd \
	php-intl \
	php-mbstring \
	php-soap \
	php-xml \
	php-xmlrpc \
	php-curl \
	php-zip \
	git
RUN apt-get clean

# Environment options.
ENV INSTALL **Boolean**

# Add scripts.
COPY pullMoodle.sh runServer.sh /usr/local/bin/

VOLUME /var/www/html

EXPOSE 80

CMD ["runServer.sh"]