#!/bin/bash

set -e

if [ ! -f '/etc/named.conf' ]; then
  find /entrypoint.d -type f | sort -n |
  while read f; do
    case "$f" in
      *.sh) echo "$0: running \"$f\""; . "$f" ;;
      *) echo "$0: ignoring $f" ;;
    esac
    echo
  done
fi

exec bash -c "$@"
