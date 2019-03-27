FROM openjdk:11-jdk-slim AS java-build

WORKDIR /app/

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
RUN ./mvnw dependency:go-offline

COPY src src
RUN ./mvnw package
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

RUN adduser --system --home /var/cache/bootapp --shell /sbin/nologin bootapp;




FROM golang:1.12 as golang-build

WORKDIR /go/src/app
COPY cmd cmd

RUN go install -v ./...




FROM gcr.io/distroless/java:11

COPY --from=golang-build /go/bin/healthcheck /app/healthcheck
HEALTHCHECK --start-period=120s CMD ["/app/healthcheck"]

COPY --from=java-build /etc/passwd /etc/shadow /etc/
ARG DEPENDENCY=/app/target/dependency
COPY --from=java-build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=java-build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=java-build ${DEPENDENCY}/BOOT-INF/classes /app

USER bootapp
ENV _JAVA_OPTIONS "-XX:MaxRAMPercentage=90 -Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Dfile.encoding=UTF-8"
ENTRYPOINT ["java","-cp","app:app/lib/*","com.example.demo.DemoApplication"]