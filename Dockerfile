FROM eclipse-temurin:21-jre-alpine

# Set working directory
WORKDIR /app

# Copy the Spring Boot jar
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

# Expose Spring Boot port
EXPOSE 8081

# Run the application
ENTRYPOINT ["java","-jar","app.jar"]