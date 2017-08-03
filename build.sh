
srvs=("rabbitmq redis server uchiwa")
for i in $srvs; do
	docker rm $i -f
	docker build -t sensu_$i ./$i
done

#docker-compose up

