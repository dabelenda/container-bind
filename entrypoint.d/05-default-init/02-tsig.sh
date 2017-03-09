#!/bin/bash

if [ ! -z "${BIND_KEYS_LIST}" ]; then
  while read -r line; do
    if echo $line | grep -vq '^[[:space:]]*\([-[:alnum:]\._=]\+\)[[:space:]]\+\([[:alnum:]/=]\+\)[[:space:]]*$'; then
      echo "'$line' is malformed in BIND_KEYS_LIST (ignoring)" > /dev/stderr
    fi

    echo $line | sed -n s/'^[[:space:]]*\([-[:alnum:]\._=]\+\)[[:space:]]\+\([[:alnum:]/=]\+\)[[:space:]]*$'/'key \1 { algorithm hmac-md5; secret "\2"; };'/p >> /etc/named.conf
  done <<< "${BIND_KEYS_LIST}"
fi
