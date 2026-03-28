# Use Amazon Corretto 17 (OpenJDK 17)
FROM amazoncorretto:17

# Set working directory inside container
WORKDIR /app

# Copy the built JAR from Maven target folder
COPY target/java-ci-cd-1.0-SNAPSHOT.jar app.jar

# Run the app using the Main-Class specified in the JAR manifest
CMD ["java", "-jar", "app.jar"]
