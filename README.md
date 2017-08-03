# Sensu &amp; Grafana in Docker
Files for Sensu &amp; Grafana in Docker (Distributed)

**NOTE: If you are installing this in an environment without internet access, you will need to use docker save and load to mount the grafana and graphite images onto your host.**

## Installation Guide
1. Run ./build.sh
2. Run ./setup_ssl.sh generate
3. You will find that inside the docker-compose.yml file:
   - Uchiwa, Sensu + Redis containers all map volumes/ssl/client to /etc/sensu/ssl.
   - RabbitMQ container maps volumes/ssl/server to /etc/rabbitmq/ssl.

   Move these directories and the other mounted volumes inside ./volumes to wherever you see fit, and update docker-compose.yml accordingly.

## Ports:

| Service                | Port  |
| ---------------------- | ----- |
| Uchiwa Web Dashboard   | 3000  |
| Grafana Web Dashboard  | 3030  |
| Graphite Data UI       | 8080  |



[
	{ rabbit, [
		{ loopback_users, [ ] },
		{log_levels, [{connection, debug}, {channel, debug}]},
        {ssl_listeners, [5671]},
        {ssl_allow_poodle_attack, true},
        {ssl_options, [{cacertfile,"/etc/rabbitmq/ssl/cacert.pem"},
				{certfile,"/etc/rabbitmq/ssl/cert.pem"},
				{keyfile,"/etc/rabbitmq/ssl/key.pem"},
				{verify,verify_peer},
				{fail_if_no_peer_cert,true}]}
		{ default_user, <<"sensu">> },
		{ default_vhost, <<"/sensu">> },
		{ hipe_compile, false }
	] },
	{ rabbitmq_management, [ { listener, [
		{ port, 15672 },
		{ ssl, false }
	] } ] }
].


    - RABBITMQ_DEFAULT_VHOST=/sensu
    - RABBITMQ_DEFAULT_USER=sensu
    - RABBITMQ_DEFAULT_PASS=secret