# Use lightweight Java runtime
FROM amazoncorretto:17

# Set working directory
WORKDIR /app

# Copy jar from Jenkins build
COPY target/java-ci-cd-1.0-SNAPSHOT.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
