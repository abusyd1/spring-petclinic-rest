FROM maven:3.6.3-jdk-8 AS build

WORKDIR /build

COPY . .

RUN mvn clean install

FROM openjdk:8-jre-alpine3.9

COPY --from=build /build/target/spring-petclinic-rest-2.4.2.jar demo.jar

EXPOSE 9966

ENTRYPOINT ["java", "-jar", "/demo.jar"]
