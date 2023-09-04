FROM amazoncorretto:11

LABEL author="Panneer"
LABEL orgination="STS"

###RUN curl -fsSL https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar -o spring-petclinic-2.4.2.jar

RUN mkdir /petspc

WORKDIR /petspc

ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar /petspc/spring-petclinic-2.4.2.jar

EXPOSE 8080

CMD [ "java", "-jar", "spring-petclinic-2.4.2.jar" ]