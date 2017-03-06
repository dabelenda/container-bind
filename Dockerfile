FROM centos:7

RUN yum install bind bind-dyndb-ldap -y && yum clean all

COPY ./entrypoint.sh /
COPY ./entrypoint.d/ /entrypoint.d

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "named", "-c", "/etc/my_named.conf", "-g" ]
