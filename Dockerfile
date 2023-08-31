FROM openjdk:11
LABEL author="Panneer"
LABEL orgination="STS"

RUN wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar -o /spc.jar

EXPOSE 8080

CMD ["java", "-jar", "/spc.jar"]