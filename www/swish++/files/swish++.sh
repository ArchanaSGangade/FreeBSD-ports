#!/bin/sh

if ! PREFIX=$(expr $0 : "\(/.*\)/etc/rc\.d/$(basename $0)\$"); then
    echo "$0: Cannot determine the PREFIX" >&2
    exit 1
fi

case "$1" in
start)
	[ -x ${PREFIX}/bin/searchmonitor -a -f ${PREFIX}/etc/swish++.conf ] && ${PREFIX}/bin/searchmonitor -c ${PREFIX}/etc/swish++.conf -s ${PREFIX}/search &
	;;
stop)
	;;
*)
	echo "Usage: `basename $0` {start|stop}" >&2
	;;
esac

exit 0
