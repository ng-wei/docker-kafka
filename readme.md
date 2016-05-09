# docker-kafka
-------
This configuration builds a docker container to run kafka.
### Note
-------
kafka version is 0.9.0.0


### Build Image
--------
	$ docker built -t kafka:0.9 .
	
### Run Kafka
--------
	$ docker run -p 2181:2181 -p 9092:9092 \
	$ 	-e "ADVERTISE_HOST_NAME=`docker-machine ip default`" \
	$	-e "ADVERTISE_PORT=9092" \
	$	--name kafka-server \
	$ 	kafka:0.9 ./bin/start-kafka.sh
	
	
Environment variable `ADVERTISE_HOST_NAME` and `ADVERTISE_PORT` used to resolved the problem that kafka server behind NAT. More infomation refer [here](http://stackoverflow.com/questions/35002343/kafka-docker-error-when-sending-message-from-host-to-container-batch-expire)


### Testing
-------
	$ cd ${KAFKA_HOME}
	
	# create topic `test`
	$ ./bin/kafka-topics.sh --create --zookeeper `docker-machine ip default`:2181 --replication-factor 1 --partitions 1 --topic test
	
	# start consumer
	$ ./bin/kafka-console-consumer.sh --zookeeper `docker-machine ip default`:2181 --topic test --from-beginning
	
	# start producer
	$ ./bin/kafka-console-producer.sh --broker-list `docker-machine ip default`:9092 --topic test
	this is a message

### Bugs
-------
null