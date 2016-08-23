FROM daocloud.io/library/mysql:5.5.45
MAINTAINER DM_Test

RUN yum -y update
RUN mkdir -p /usr/share/clowdflows/
RUN yum install -y unzip wget
ADD ./ /usr/share/clowdflows/

EXPOSE 9001
EXPOSE 8000
