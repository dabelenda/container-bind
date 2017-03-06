#!/bin/bash

: ${BIND_CONFIG_LDAP:="False"}

if [ ${BIND_CONFIG_LDAP} == "True" ]; then

  : ${BIND_LDAP_SERVER:?"BIND_LDAP_SERVER must be set"}
  : ${BIND_LDAP_BASE_DN:?"BIND_LDAP_BASE_DN must be set"}
  : ${BIND_LDAP_BIND_DN:?"BIND_LDAP_BIND_DN must be set"}
  : ${BIND_LDAP_BIND_PASSWORD:?"BIND_LDAP_BIND_PASSWORD must be set"}
  : ${BIND_LDAP_URI_SCHEME:="ldap"}

  cat >> /etc/my_named.conf <<-EOF
		
		# Configure BIND to get Data from LDAP
		dynamic-db "ldap-dns" {
		  library "ldap.so";
		  arg "uri ${BIND_LDAP_URI_SCHEME}://${BIND_LDAP_SERVER}"
		  arg "base ${BIND_LDAP_BASE_DN}"
		  arg "auth_method simple"
		  arg "bind_dn ${BIND_LDAP_BIND_DN}"
		  arg "password ${BIND_LDAP_BIND_PASSWORD}"
		  arg "serial_autoincrement yes"
		};
		EOF
fi
