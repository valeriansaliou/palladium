#!/bin/bash

cp http-bind.war /var/lib/tomcat7/webapps
rm -r /var/lib/tomcat7/webapps/http-bind
service tomcat7 restart
