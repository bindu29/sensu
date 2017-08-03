FROM centos:centos6.7

MAINTAINER Steven Ayers

RUN yum -y install wget
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
RUN yum install -y erlang-19.0 tar socat logrotate
RUN rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
RUN rpm -Uvh http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.3/rabbitmq-server-3.6.3-1.noarch.rpm
RUN echo 'NODENAME=rabbit@localhost' > /etc/rabbitmq/rabbitmq-env.conf
RUN rabbitmq-plugins enable rabbitmq_management
RUN /etc/init.d/rabbitmq-server start \
&& rabbitmqctl add_vhost /sensu \
&& rabbitmqctl add_user sensu secret \
&& rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*" \
&& rabbitmqctl set_user_tags sensu management
RUN /etc/init.d/rabbitmq-server stop

EXPOSE 5671

CMD exec rabbitmq-server $@
