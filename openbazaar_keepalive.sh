#!/bin/bash
curl -I -m 30 http://localhost:18469 2> /dev/null

if [[ $? != 0 ]]; then
	killall openbazaard
	sleep 5
	cd /usr/share/openbazaar/resources/OpenBazaar-Server
	openbazaard start --daemon --loglevel debug -p 39347
	echo "openbazaard was down but we restarted it: `date`" > /var/log/openbazaard
	exit 1
fi
exit 0
