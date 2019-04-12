# Production-grade Docker build

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/petewoods/spring-boot-multistage-docker.svg)

This is a trivial Spring Boot app using production-grade multi-stage Docker builds,
efficient Docker layers and a Distroless base image.

See the related blog post [here](https://pete-woods.com/2019/02/production-grade-spring-boot-docker-images/).

## Building the image
```
# docker build -t petewoods/spring-boot-multistage-docker .
```

## Running the container
```
# docker run --rm -p 8080:8080 petewoods/spring-boot-multistage-docker
```

You can then visit http://localhost:8080 in your browser, or run
```
# curl http://localhost:8080
```
to verify it works.

## Existing builds
Existing builds can be found at [Docker hub](https://hub.docker.com/r/petewoods/spring-boot-multistage-docker).
