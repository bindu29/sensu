# Sensu &amp; Grafana in Docker

#### Docker implementation of Sensu & Grafana, using secure SSL communication between client nodes and RabbitMQ.

## Installation Guide
1. Run ./build.sh
2. Run ./setup_ssl.sh generate
3. docker-compose up -d

## Defaults

### Ports:

| Service                | Port  |
| ---------------------- | ----- |
| Uchiwa Web Dashboard   | 3000  |
| Grafana Web Dashboard  | 3030  |
| Graphite Data UI       | 8080  |

### Volumes

Volumes all use paths relative to the docker-compose.yml file.

The log directories mapped to the host will fill up very quickly, so it is advised that these are managed under log rotation.

| Container | Purpose                 | Host Directory                       | Container Directory               |
|-----------|-------------------------|--------------------------------------|-----------------------------------|
| Redis     | RDB store directory     | ./volumes/redis/lib                  | /var/lib/redis                    |
| RabbitMQ  | Configuration file      | ./volumes/rabbitmq/rabbit.config     | /etc/rabbitmq/rabbit.config       |
| RabbitMQ  | Env configuration file  | ./volumes/rabbitmq/rabbitmq-env.conf | /etc/rabbitmq/rabbitmq-env.conf   |
| RabbitMQ  | Log directory           | ./volumes/rabbitmq/logs              | /var/log/rabbitmq                 |
| RabbitMQ  | Server SSL directory    | ./volumes/ssl/server                 | /etc/rabbitmq/ssl                 |
| Server    | Configuration directory | ./volumes/server/sensu/conf.d        | /etc/sensu/conf.d                 |
| Server    | Log directory           | ./volumes/server/logs                | /var/log/sensu                    |
| Server    | Client SSL directory    | ./volumes/ssl/client                 | /etc/sensu/ssl                    |
| Uchiwa    | Configuration file      | ./volumes/uchiwa/config.json         | /config/config.json               |
| Graphite  | Data directory          | ./volumes/graphite                   | /var/lib/graphite/storage/whisper |


### RabbitMQ

When changing RabbitMQ configurations, you'll want to make sure that the configuration for sensu (rabbitmq.json) reflects the changes made.

- VHost: /sensu
- User: sensu
- Password: secret
