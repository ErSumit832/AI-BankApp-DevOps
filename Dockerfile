#get a base image

FROM eclipse-temurin:21-jdk-jammy

# create a work repo

WORKDIR /app

#copy all  code

COPY . .
#make maven wrapper executable and build project

RUN chmod +x mvnw && ./mvnw clean package -DskipTests -B

#expose port 

EXPOSE 8080

# Define ENTRYPINT
    
ENTRYPOINT ["sh", "-c", "java -jar target/*.jar"]
