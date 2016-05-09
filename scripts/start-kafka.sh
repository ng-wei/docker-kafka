#!/bin/bash

./bin/zookeeper-server-start.sh ./config/zookeeper.properties &

# to resolved the problem that kafka server is behind nat
echo "advertised.host.name=${ADVERTISE_HOST_NAME}" >> ./config/server.properties
echo "advertised.port=${ADVERTISE_PORT}" >> ./config/server.properties
./bin/kafka-server-start.sh ./config/server.properties
