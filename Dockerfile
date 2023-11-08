FROM maven:3.1.2 AS build
WORKDIR /app
COPY pom.xml /app
RUN mvn dependency:resolve
COPY /app 4
RUN mvn clean
RUN mvn package -DskipTests -X
FROM openjdk
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8088
CHD ("java", "-jar", "app.jar"]