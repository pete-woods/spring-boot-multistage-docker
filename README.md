# Demo Spring Boot app using multi-stage Docker builds, efficient Docker layers and Distroless

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/petewoods/spring-boot-multistage-docker.svg)

## Building
```
docker build -t petewoods/spring-boot-multistage-docker .
```

## Running
```
docker run --rm -p 8080:8080 petewoods/spring-boot-multistage-docker
```

## Builds
Existing builds can be found at [Docker hub](https://hub.docker.com/r/petewoods/spring-boot-multistage-docker).
