#!/bin/sh

########################################################################################################################

if [ -z "${TASK_SERVER_NAME}" ] || [ -z "${MQTT_URL}" ] || [ -z "${MQTT_USERNAME}" ] || [ -z "${MQTT_PASSWORD}" ] || [ -z "${JDBC_URL}" ] || [ -z "${JDBC_USERNAME}" ] || [ -z "${JDBC_PASSWORD}" ]
then
  echo 'Please specify environment variables: TASK_SERVER_NAME, MQTT_URL, MQTT_USERNAME, MQTT_PASSWORD, JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD'

  exit 1
fi

########################################################################################################################

cat > /AMITaskServer/AMI.xml << EOF
<?xml version="1.0" encoding="ISO-8859-1"?>

<properties>
	<property name="server_name"><![CDATA[${TASK_SERVER_NAME}]]></property>

	<property name="mqtt_url"><![CDATA[${MQTT_URL}]]></property>
	<property name="mqtt_username"><![CDATA[${MQTT_USERNAME}]]></property>
	<property name="mqtt_password"><![CDATA[${MQTT_PASSWORD}]]></property>

	<property name="jdbc_url"><![CDATA[${JDBC_URL}]]></property>
	<property name="jdbc_username"><![CDATA[${JDBC_USERNAME}]]></property>
	<property name="jdbc_password"><![CDATA[${JDBC_PASSWORD}]]></property>

	<property name="exclusion_server_url"><![CDATA[${EXCLUSION_SERVER_URL}]]></property>

	<property name="quality_of_service"><![CDATA[${QUALITY_OF_SERVICE}]]></property>
	<property name="max_nb_of_running_tasks"><![CDATA[${MAX_NB_OF_RUNNING_TASKS}]]></property>
	<property name="priority_probability_ratio"><![CDATA[${PRIORITY_PROBABILITY_RATIO}]]></property>

</properties>
EOF

########################################################################################################################

AMI_CLASSPATH=$(find /AMITaskServer/lib/ -name '*.jar' | xargs echo | tr ' ' ':')

########################################################################################################################

java -Dfile.encoding=UTF-8 -Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom -Dami.conffile=/AMITaskServer/AMI.xml -classpath "${AMI_CLASSPATH}" net.hep.ami.task.Main

########################################################################################################################
