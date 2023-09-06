FROM maven:3-amazoncorretto-17 AS builder
COPY . /spring-petclinic
RUN  cd /spring-petclinic && mvn package

FROM amazoncorretto:17-alpine3.17
LABEL author="Panneer"
LABEL orgination="STS"
ARG USERNAME="petspc"
ARG HOMEDIR="/petspc"
ENV TESTENV=petspcenv
RUN adduser -h ${HOMEDIR} -s /bin/sh -D ${USERNAME}
USER ${USERNAME}
WORKDIR ${HOMEDIR}
COPY --from=builder --chown=${USERNAME}:${USERNAME} /spring-petclinic/target/spring-petclinic-3.1.0-SNAPSHOT.jar "${HOMEDIR}/spring-petclinic-3.1.0-SNAPSHOT.jar"
EXPOSE 8080
CMD [ "java", "-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar" ]