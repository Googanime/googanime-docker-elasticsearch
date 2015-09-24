#!/bin/bash

set -e

# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch "$@"
fi

# Drop root privileges if we are running elasticsearch
if [ "$1" = 'elasticsearch' ]; then
	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data
	exec gosu elasticsearch "$@"
fi

exec "$@"
