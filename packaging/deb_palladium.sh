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
TC_VERSION="7.0.70"
TC_MAJOR=${TC_VERSION:0:1}

# Palladium version
PL_VERSION="1.5.1"

# Cleanup
rm -rf ./opt
rm -rf ./var
rm -rf ./tmp
rm -f *.deb

# Create directory structure
mkdir ./opt
mkdir ./tmp
mkdir ./var
mkdir ./var/log
mkdir ./var/log/palladium
mkdir ./var/cache
mkdir ./var/cache/palladium

# Download and untar Tomcat
curl "http://archive.apache.org/dist/tomcat/tomcat-${TC_MAJOR}/v${TC_VERSION}/bin/apache-tomcat-${TC_VERSION}.tar.gz" | tar -zxv
mv ./apache-tomcat-${TC_VERSION} ./opt/palladium

# Move files
cp ../http-bind.war ./opt/palladium/webapps
cp ./conf/server.xml ./opt/palladium/conf

# Symlink work, temp and logs
rm -rf ./opt/palladium/work
ln -s  ../../var/cache/palladium ./opt/palladium/work

rm -rf ./opt/palladium/temp
ln -s  ../../tmp                 ./opt/palladium/temp

rm -rf ./opt/palladium/logs
ln -s  ../../var/log/palladium   ./opt/palladium/logs

# Create DEB
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
        --deb-user "palladium" \
        --deb-group "palladium" \
        --deb-upstart ./conf/palladium.conf \
        --before-install ./conf/deb_before_install.sh \
        opt var

# Cleanup
rm -rf ./opt
rm -rf ./var
rm -rf ./tmp