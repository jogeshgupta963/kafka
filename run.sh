#! /bin/bash

docker run -it -d -p 2181:2181 zookeeper

docker run -p 9092:9092 \
-e KAFKA_ZOOKEEPER_CONNECT=192.168.56.1:2181 \
-e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://192.168.56.1:9092 \
-e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
confluentinc/cp-kafka

# docker run -p 9092:9092 \
# -e KAFKA_ZOOKEEPER_CONNECT=192.168.56.1:2181 \
# -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://<PRIVATE_IP>:9092 \
# -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
# confluentinc/cp-kafka