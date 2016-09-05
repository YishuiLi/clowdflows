FROM centos:7.2.1511

MAINTAINER DM_Test

RUN yum -y update
RUN yum install -y  libxslt libxml2 readline-devel openssl openssl-devel zlib zlib-develncurses-devel gcc-c++ gdbm-devel expat-devel libGL-devel libX11-devel  sqlite-devel curl PyQt4 PyQt4-devel PyQt4-webkit scipy epel-release gcc numpy python-devel python-matplotlib epel-release bzip2-devel ncurses-devel sqlite-devel git python-virtualenv libxcb libxcb-devel libXrender libXrender-devel libevent-devel erlang
RUN mkdir -p /usr/share/clowdflows/
ADD ./ /usr/share/clowdflows/
RUN yum install -y python-matplotlib epel-release python-pip
RUN pip install discomll
RUN pip install -r /usr/share/clowdflows/requirements.txt
RUN cp /usr/share/clowdflows/mothra/__local_settings.py /usr/share/clowdflows/mothra/local_settings.py
RUN python /usr/share/clowdflows/manage.py syncdb --noinput
RUN python /usr/share/clowdflows/manage.py migrate
RUN python /usr/share/clowdflows/manage.py import_all

EXPOSE 9001
EXPOSE 8000
