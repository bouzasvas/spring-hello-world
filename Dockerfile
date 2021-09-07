ARG APPLICATION_NAME=spring-boot-mvn

# Build Application using Maven
FROM maven:3.8.2-openjdk-11-slim AS MVN_BUILD
ARG APPLICATION_NAME
WORKDIR /opt/${APPLICATION_NAME}/src

COPY . .
RUN ["mvn", "clean", "install"]

# Run builded Application using .jar produced by previous Stage
FROM openjdk:11 AS RUN
ARG APPLICATION_NAME
WORKDIR /opt/${APPLICATION_NAME}

COPY --from=MVN_BUILD /opt/${APPLICATION_NAME}/src/target/*.jar target/app.jar
CMD ["java", "-jar", "target/app.jar"]
