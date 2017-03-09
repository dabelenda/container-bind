#!/bin/bash


set -x

find /entrypoint.d -type f | sort -n |
while read f; do
  case "$f" in
    *.sh) echo "$0: running \"$f\""; . "$f" ;;
    *) echo "$0: ignoring $f" ;;
  esac
  echo
done

exec bash -c "$@"
