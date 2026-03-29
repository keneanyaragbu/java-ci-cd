# Use Eclipse Temurin OpenJDK 17 as base image
FROM eclipse-temurin:17

# Set working directory
WORKDIR /app

# Copy the built jar
COPY target/java-ci-cd-1.0-SNAPSHOT.jar app.jar

# Expose port 8080
EXPOSE 8080

# Run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]
