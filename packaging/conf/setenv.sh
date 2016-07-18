#!/bin/sh

JAVA_OPTS="-Djava.awt.headless=true -Xmx4096m -XX:+UseParNewGC -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/var/log"
