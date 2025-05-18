FROM gradle:8.13-jdk21 AS build
WORKDIR /app
COPY . .
RUN gradle build --no-daemon

FROM openjdk:21-jdk-slim
WORKDIR /app
COPY --from=build /app/build/libs/discografia-1.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]' > Dockerfile