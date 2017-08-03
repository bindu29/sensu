FROM centos:centos6.7

MAINTAINER Steven Ayers

#COPY uchiwa.json /etc/sensu/
COPY sensu.repo /etc/yum.repos.d/

RUN rpm -Uvh http://dl.bintray.com/palourde/uchiwa/uchiwa-0.17.1-1.x86_64.rpm
RUN yum -y install sensu initscripts

EXPOSE 3000

ENTRYPOINT ["/opt/uchiwa/bin/uchiwa","-c", "/etc/sensu/uchiwa.json", "-d", "/etc/sensu/dashboard.d", "-p", "/opt/uchiwa/src/public"]
