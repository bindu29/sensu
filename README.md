# Sensu &amp; Grafana in Docker
Files for Sensu &amp; Grafana in Docker (Distributed)

**NOTE: If you are installing this in an environment without internet access, you will need to use docker save and load to mount the grafana and graphite images onto your host.**

## Installation Guide
1. Run ./build.sh
2. Run ./setup-ssl.sh generate
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
| RabbitMQ Management UI | 15672 |

