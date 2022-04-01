########################################################################################################################

FROM amazoncorretto:17-alpine

########################################################################################################################

LABEL maintainer="Jérôme ODIER <odier.jerome@lpsc.in2p3.fr>"

LABEL description="AMI Task Server"

########################################################################################################################

ENV TASK_SERVER_NAME=""

ENV MQTT_URL=""
ENV MQTT_USERNAME=""
ENV MQTT_PASSWORD=""

ENV JDBC_URL=""
ENV JDBC_USERNAME=""
ENV JDBC_PASSWORD=""

ENV EXCLUSION_SERVER_URL=""

ENV MAX_NB_OF_RUNNING_TASKS="10"

ENV PRIORITY_PROBABILITY_FACTOR="2.0"

########################################################################################################################

RUN wget -O AMITaskServer-bundle.zip https://ami.in2p3.fr/download/AMITaskServer-1.0.0-bundle.zip

RUN unzip AMITaskServer-bundle.zip

COPY docker-entrypoint.sh /AMITaskServer/docker-entrypoint.sh

########################################################################################################################

WORKDIR "/AMITaskServer"

VOLUME ["/AMITaskServer/tasks/"]

ENTRYPOINT ["/bin/sh", "/AMITaskServer/docker-entrypoint.sh"]

########################################################################################################################
