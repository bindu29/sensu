#!/bin/sh

srvs=("server")
for i in $srvs; do
	docker rm $i -f
	docker build -t sensu_$i ./build/$i
done

#docker-compose up

