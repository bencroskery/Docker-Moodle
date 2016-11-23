#!/bin/bash

# Add new moodle
cd /var/www/html
rm -Rf * .*
git clone -b MOODLE_31_STABLE git://git.moodle.org/moodle.git . --depth=1

# Add new moodledata
cd /var/www
rm -Rf moodledata
mkdir moodledata

# Open up everything
chmod -R 777 .
chown -R apache:apache .