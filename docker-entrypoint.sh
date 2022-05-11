#!/bin/sh

########################################################################################################################

if [ -z "${SERVER_NAME}" ] || [ -z "${MQTT_URL}" ] || [ -z "${MQTT_USERNAME}" ] || [ -z "${MQTT_PASSWORD}" ] || [ -z "${JDBC_URL}" ] || [ -z "${JDBC_USERNAME}" ] || [ -z "${JDBC_PASSWORD}" ]
then
  echo 'Please specify environment variables: SERVER_NAME, MQTT_URL, MQTT_USERNAME, MQTT_PASSWORD, JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD'

  exit 1
fi

########################################################################################################################

AMI_CLASSPATH=$(find /AMITaskServer/lib/ -name '*.jar' | xargs echo | tr ' ' ':')

########################################################################################################################

java \
-server \
\
-Dami.server_name="${SERVER_NAME}" \
\
-Dami.mqtt_url="${MQTT_URL}" \
-Dami.mqtt_username="${MQTT_USERNAME}" \
-Dami.mqtt_password="${MQTT_PASSWORD}" \
\
-Dami.jdbc_url="${JDBC_URL}" \
-Dami.jdbc_username="${JDBC_USERNAME}" \
-Dami.jdbc_password="${JDBC_PASSWORD}" \
\
-Dami.exclusion_server_url="${EXCLUSION_SERVER_URL}" \
\
-Dami.cleanup_time="${CLEANUP_TIME}" \
-Dami.quality_of_service="${QUALITY_OF_SERVICE}" \
-Dami.max_nb_of_running_tasks="${MAX_NB_OF_RUNNING_TASKS}" \
-Dami.priority_probability_ratio="${PRIORITY_PROBABILITY_RATIO}" \
\
-Dami.conf_file=/AMITaskServer/workspace/AMI.xml \
\
-Dfile.encoding=UTF-8 -Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom \
\
-classpath "${AMI_CLASSPATH}" \
\
net.hep.ami.task.Main

########################################################################################################################
