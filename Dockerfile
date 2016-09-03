FROM centos:7.2.1511

MAINTAINER DM_Test

RUN mkdir -p /usr/share/clowdflows/
ADD ./ /usr/share/clowdflows/

ENV MYSQL_ROOT_PASSWORD 123456

EXPOSE 9001
EXPOSE 8000
