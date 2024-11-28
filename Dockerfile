FROM openjdk:17-alpine AS builder

WORKDIR /app

COPY . .

RUN ./gradlew build -x test

FROM openjdk:17-alpine AS base

WORKDIR /app

COPY --from=builder /app/build/libs/spring-petclinic-3.3.0.jar petclinic.jar

EXPOSE 8080

CMD ["java", "-jar", "petclinic.jar"]
