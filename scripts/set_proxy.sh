#!/bin/bash
[ $# -lt 1 ] && echo "Must have at least one argument No proxy set" >&2 || echo "passed argument : $1" >&2

if [ $# -eq 1 ] ; then 
[ ! "$1" == "none" ] && echo "Acquire::http::Proxy \"$1\";" >> /etc/apt/apt.conf || echo "no proxy set" >&2
fi

exit $?
