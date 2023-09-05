FROM amazoncorretto:11-alpine-jdk

LABEL author="Panneer"
LABEL orgination="STS"

ARG DOWNLOAD_LOCATION="https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar"
ARG USERNAME="petspc"
ARG HOMEDIT="/petspc"

###RUN curl -fsSL https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar -o spring-petclinic-2.4.2.jar
###RUN mkdir /petspc

RUN adduser -h ${HOMEDIT} -s /bin/sh -D ${USERNAME}

USER ${USERNAME}

WORKDIR ${HOMEDIT}

ADD --chown=${USERNAME}:${USERNAME} ${DOWNLOAD_LOCATION} /petspc/spring-petclinic-2.4.2.jar

EXPOSE 8080

CMD [ "java", "-jar", "spring-petclinic-2.4.2.jar" ]