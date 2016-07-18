#!/bin/bash
#
# This script would build a DEB package with standalone Tomcat7 and Palladium
#
# Script requirements:
# sudo apt-get install ruby
# sudo apt-get install ruby-dev
# sudo gem install fpm
#

# Tomcat version
JT_VERSION="9.2.17.v20160517"

# Palladium version
PL_VERSION="1.5.1"

# Cleanup
rm -rf ./opt
mkdir ./opt
rm -f *.deb

# Download and untar Jetty
curl "http://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/${JT_VERSION}/jetty-distribution-${JT_VERSION}.tar.gz" | tar -zxv

# Move files
mv ./jetty-distribution-${JT_VERSION} ./opt/palladium
cp ../http-bind.war ./opt/palladium/webapps
cp ./ini/start.ini ./opt/palladium

    fpm -n palladium \
        -v ${PL_VERSION} \
        -a all \
        --license 'Apache Version 2.0' \
        -m "<root@example.com>" \
        --vendor "Example" \
        -d openjdk-7-jre \
        -t deb \
        -s dir \
        --description "Palladium is an open source software implementation of the XEP-0124: Bidirectional-streams Over Synchronous HTTP (BOSH) protocol" \
        --url 'http://codingteam.net/project/palladium' \
        opt

# Cleanup
rm -rf ./opt
