#!/bin/sh
set -e

if ! getent group "palladium" > /dev/null 2>&1 ; then
    addgroup --system "palladium" --quiet
fi
if ! id "palladium" > /dev/null 2>&1 ; then
    adduser --system --home /opt/palladium --no-create-home \
	--ingroup "palladium" --disabled-password --shell /bin/false \
	"palladium"
fi

chown -R palladium /opt/palladium       2> /dev/null || true
chown -R palladium /var/log/palladium   2> /dev/null || true
chown -R palladium /var/cache/palladium 2> /dev/null || true
