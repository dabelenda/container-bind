Bind Server
===========

This repository contains an image.

This image runs a single [DNS Server](http://bind9.net).

## Configuration

To configure the bind server, some environment variables need to be set.

- *BIND_RECURSION*: Allow recursion requests, set to no for an authoritative server.
- *BIND_CONFIG_LDAP*: Set to "True" to use [bind-dyndb-ldap](https://pagure.io/bind-dyndb-ldap)
- *BIND_LDAP_SERVER*: The LDAP IP/DNS name to use with bind-dyndb-ldap
- *BIND_LDAP_BASE_DN*: The Base DN where the records are for with bind-dyndb-ldap
- *BIND_LDAP_BIND_DN*: The DN bind-dyndb-ldap will use for auth on the LDAP server 
- *BIND_LDAP_BIND_PASSWORD*: The password bind-dyndb-ldap will use for auth on the LDAP server 
- *BIND_LDAP_URI_SCHEME*: The scheme bind-dyndb-ldap will use to connect to the ldap server, can be "ldap" or "ldaps"
