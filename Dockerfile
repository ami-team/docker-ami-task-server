########################################################################################################################

FROM amazoncorretto:11-alpine

########################################################################################################################

LABEL maintainer="Jérôme ODIER <odier.jerome@lpsc.in2p3.fr>"

LABEL description="AMI Task Server"

########################################################################################################################

ENV SERVER_NAME=""

ENV MQTT_URL=""
ENV MQTT_USERNAME=""
ENV MQTT_PASSWORD=""

ENV JDBC_URL=""
ENV JDBC_USERNAME=""
ENV JDBC_PASSWORD=""

ENV EXCLUSION_SERVER_URL=""

ENV PING_PERIOD="10"
ENV CLEANUP_PERIOD="172800"
ENV QUALITY_OF_SERVICE="0"
ENV MAX_NB_OF_RUNNING_TASKS="10"
ENV PRIORITY_PROBABILITY_RATIO="2.0"

########################################################################################################################

RUN ["apk", "add", "--update", "--no-cache", "bash", "python3"]

########################################################################################################################

RUN ["wget", "-O", "AMITaskServer-bundle.zip", "https://ami.in2p3.fr/download/AMITaskServer-1.0.0-bundle.zip"]

RUN ["unzip", "AMITaskServer-bundle.zip"]

RUN ["rm", "AMITaskServer-bundle.zip"]

########################################################################################################################

RUN ["mv", "/AMITaskServer/tasks/java_stub.sh", "/AMITaskServer/java_stub.sh.orig"]

########################################################################################################################

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN ["chmod", "a+x", "/docker-entrypoint.sh"]

########################################################################################################################

COPY AMI.xml /AMITaskServer/AMI.xml

########################################################################################################################

VOLUME /AMITaskServer/logs/
VOLUME /AMITaskServer/tasks/

########################################################################################################################

WORKDIR /AMITaskServer/

########################################################################################################################

ENTRYPOINT ["/docker-entrypoint.sh"]

########################################################################################################################
