#!/bin/bash
# The purpose of this script is to prepare the ingestion cluster to run kafka
# ssh into the master node after starting kafka. then run this script from the home directory of the master node
printf '\n'
printf 'Running test:'
printf '\n'

BASEDIR=$(dirname "$0")
source ${BASEDIR}/produce_cluster_config.sh
# KAFKA_LISTENER is the hostname and port the kafka broker will advertise to producers and consumers.
# To find this value, SSH into the master node of the ingestion cluster and type this command:
# less /usr/local/kafka/config/server.properties
#KAFKA_LISTENER=ec2-52-202-238-209.compute-1.amazonaws.com:9092

# TOPIC_NAME is the name of the topic as defined in the bash script prepare_kafka.sh in the ingestion cluster main node
#TOPIC_NAME=user_data_01

# SIM_FILE: This is the path, filename and extension of the results simulation to process
SIM_FILE=${BASEDIR}/sim_results/path0000007.csv

#python ${BASEDIR}/gps_prod_kafka.py $KAFKA_LISTENER $TOPIC_NAME ${SIM_FILE}
python ${BASEDIR}/start_producer.py $KAFKA_LISTENER $TOPIC_NAME

# Testing commands:
# Create consumer from console, read from beginning:
# /usr/local/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic 'user_data_01' --from-beginning

# Create consumer from console, don't read from beginning:
# /usr/local/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic 'user_data_01'

# Producer from console:
#/usr/local/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic 'user_data_01'
