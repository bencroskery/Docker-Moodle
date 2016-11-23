FROM centos:7
MAINTAINER Ben Croskery <ben@irtech.com>
LABEL Description="PHP 5.4 + Moodle." \
	License="Apache License 2.0" \
	Usage="docker run -d -p [HOST PORT NUMBER]:80 -v [HOST WWW DOCUMENT ROOT]:/var/www/html bencroskery/moodle:php54" \
	Version="1.0"

# Install Apache, PHP, GIT
RUN yum update -y
RUN yum install -y httpd
RUN yum install -y \
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
	git
RUN yum clean all

# Environment options.
ENV INSTALL **Boolean**

# Add scripts.
COPY pullMoodle.sh runServer.sh /usr/local/bin/

VOLUME /var/www/html

EXPOSE 80

CMD "runServer.sh"