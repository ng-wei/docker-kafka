# Kafka 0.9.0.0 in Docker
#
# version 0.1
#
FROM java:7
MAINTAINER ng <ng@qima-inc.com>

COPY archives/kafka_2.11-0.9.0.0.tgz /usr/local
RUN cd /usr/local && \
    tar zxvf kafka_2.11-0.9.0.0.tgz && \
    ln -s kafka_2.11-0.9.0.0 kafka

COPY scripts/start-kafka.sh /usr/local/kafka/bin

WORKDIR /usr/local/kafka

EXPOSE 2181
EXPOSE 9092

