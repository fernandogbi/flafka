ARG VERSION=1.9.0
FROM  openjdk:8-alpine
LABEL maintainer="fernandogbi96@gmail.com" version=${VERSION}
RUN apk add bash --no-cache
ADD apache-flume-bin.tar.gz /usr/local
RUN mv /usr/local/apache-flume-1.9.0-bin /usr/local/apache-flume
WORKDIR /usr/local/apache-flume
ENV FLUME_HOME="/usr/local/apache-flume"
ENV PATH="${PATH}:${FLUME_HOME}/bin"
RUN mkdir /conf /spooldir