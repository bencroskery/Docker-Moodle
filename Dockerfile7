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

RUN cd /var/www/html && \
	rm index.html && \
    git clone -b MOODLE_31_STABLE git://git.moodle.org/moodle.git . --depth=1 && \
	cd mod && \
	git clone https://github.com/bencroskery/moodle-mod_socialwiki.git socialwiki
ADD ./pull.php /var/www/html/pull.php
RUN cd /var/www && \
	mkdir moodledata && \
	chmod -R 777 . && \
	chown -R www-data:www-data .

VOLUME /var/www/html
VOLUME /var/www/moodledata

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]