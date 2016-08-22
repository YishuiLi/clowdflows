FROM daocloud.io/library/centos:centos7
MAINTAINER DM_Test

RUN yum update
RUN mkdir -p /usr/share/clowdflows/
RUN yum install -y unzip wget
ADD ./ /usr/share/clowdflows/

EXPOSE 9001
EXPOSE 8000
