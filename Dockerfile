FROM centos:7.2.1511

MAINTAINER DM_Test

RUN yum -y update
RUN yum install -y  libxslt libxml2 gnome-tweak-tool readline-devel openssl openssl-devel zlib zlib-devel gmp-devel ncurses-devel rpm-build gcc-c++ mysql mysql-devel gdbm-devel expat-devel libGL-devel libX11-devel tcl-devel tk-devel tix-devel sqlite-devel curl PyQt4 PyQt4-devel PyQt4-webkit scipy epel-release gcc numpy python-devel python-matplotlib epel-release bzip2-devel ncurses-devel sqlite-devel readline-devel tk-devel readline-devel git python-virtualenv sip-devel  libxcb libxcb-devel libXrender libXrender-devel xcb-util-wm xcb-util-wm-devel xcb-util xcb-util-devel xcb-util-image xcb-util-image-devel xcb-util-keysyms xcb-util-keysyms-devel lapack lapack-devel blas blas-devel libevent-devel erlang
RUN mkdir -p /usr/share/clowdflows/
ADD ./ /usr/share/clowdflows/
RUN cd /usr/share/clowdflows/
RUN yum install python-matplotlib epel-release python-pip
RUN pip install -r requirements.txt
RUN pip install discomll
RUN python manage.py syncdb --noinput
RUN python manage.py migrate
RUN python manage.py createsuperuser
RUN python manage.py import_all

EXPOSE 9001
EXPOSE 8000
