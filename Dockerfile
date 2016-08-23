FROM daocloud.io/library/mysql:5.5.45
MAINTAINER DM_Test

RUN mkdir -p /usr/share/clowdflows/
ADD ./ /usr/share/clowdflows/

ENV MYSQL_USER root
ENV MYSQL_PASS 123456

EXPOSE 9001
EXPOSE 8000
