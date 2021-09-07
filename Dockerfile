# Build Application using Maven
FROM maven:3.8.2-openjdk-11-slim AS MVN_BUILD
# ARG APPLICATION_NAME=spring-boot-mvn
WORKDIR /opt/spring-boot-mvn/src

COPY . .
RUN ["mvn", "clean", "install"]

# Run builded Application using .jar produced by previous Stage
FROM openjdk:11 AS RUN
# ARG APPLICATION_NAME=spring-boot-mvn
WORKDIR /opt/spring-boot-mvn

COPY --from=MVN_BUILD /opt/spring-boot-mvn/src/target/*.jar target/
CMD ["java", "-jar", "target/spring-hello-world-0.0.1-SNAPSHOT.jar"]
