#!/bin/sh

########################################################################################################################

if [ ! -f /AMITaskServer/tasks/java_stub.sh ]
then
  cp /AMITaskServer/java_stub.sh.orig /AMITaskServer/tasks/java_stub.sh
fi

########################################################################################################################

AMI_CLASSPATH=$(find /AMITaskServer/lib/ -name '*.jar' | xargs echo | tr ' ' ':')

########################################################################################################################

java \
-server -Dfile.encoding=UTF-8 -Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom \
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
-Dami.ping_period="${PING_PERIOD}" \
-Dami.cleanup_period="${CLEANUP_PERIOD}" \
-Dami.quality_of_service="${QUALITY_OF_SERVICE}" \
-Dami.max_nb_of_running_tasks="${MAX_NB_OF_RUNNING_TASKS}" \
-Dami.priority_probability_ratio="${PRIORITY_PROBABILITY_RATIO}" \
\
-Dami.home=/AMITaskServer/ \
\
-Dami.conf_file=/AMITaskServer/AMI.xml \
\
-classpath "${AMI_CLASSPATH}" \
\
net.hep.ami.task.Main

########################################################################################################################
