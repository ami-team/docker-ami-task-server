#!/bin/sh

########################################################################################################################

if [ ! -f /AMITaskServer/workspace/AMI.xml ]
then
  cp /AMITaskServer/AMI.xml.orig /AMITaskServer/workspace/AMI.xml
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
