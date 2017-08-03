FROM centos:centos6.7

MAINTAINER Steven Ayers


COPY config/sensu.repo /etc/yum.repos.d/

RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum -y install redis sensu initscripts
RUN chmod 777 /etc/redis.conf

EXPOSE 6379

ENTRYPOINT ["/usr/sbin/redis-server"]
