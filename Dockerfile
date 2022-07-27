FROM openjdk:8-jdk-alpine

ARG JAR_FILE=target/javaexpress-springboot-docker.jar

RUN mkdir /opt/testjenkins

COPY ${JAR_FILE} /opt/testjenkins/javaexpress-springboot-docker.jar

ENTRYPOINT ["java","-jar","/opt/testjenkins/javaexpress-springboot-docker.jar"]
