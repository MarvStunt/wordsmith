FROM maven:3-alpine as builder
WORKDIR /app
COPY . .
RUN mvn verify

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/dependency /app/dependency
COPY --from=builder /app/target/words.jar .
CMD ["java", "-Xmx8m", "-Xms8m", "-jar", "words.jar"]