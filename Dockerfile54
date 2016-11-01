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

# Add Moodle and Socialwiki plugin.
RUN cd /var/www/html && \
    git clone -b MOODLE_31_STABLE git://git.moodle.org/moodle.git . --depth=1 && \
	cd mod && \
	git clone https://github.com/bencroskery/moodle-mod_socialwiki.git socialwiki
ADD ./pull.php /var/www/html/pull.php
RUN cd /var/www && \
	mkdir moodledata && \
	chmod -R 777 . && \
	chown -R apache:apache .

VOLUME /var/www/html
VOLUME /var/www/moodledata

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]