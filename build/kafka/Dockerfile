ARG VERSION=2.5.0
FROM  openjdk:8-alpine as base
LABEL maintainer="fernandogbi96@gmail.com" version=${VERSION}
WORKDIR /kafka
RUN apk add bash curl --no-cache
COPY "kafka-src" "/kafka"
RUN ./gradlew jar -PscalaVersion=2.12.10

FROM base as kafka
COPY docker-entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT [ "/usr/bin/docker-entrypoint.sh" ]