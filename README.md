# Demo Spring Boot app using multi-stage Docker builds, efficient Docker layers and Distroless

## Building
```
docker build -t petewoods/spring-boot-multistage-docker .
```

## Running
```
docker run --rm -p 8080:8080 petewoods/spring-boot-multistage-docker
```
