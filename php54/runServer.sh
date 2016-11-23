#!/bin/bash

if [ "$INSTALL" ]; then
    sh pullMoodle.sh
fi

/usr/sbin/httpd -D FOREGROUND