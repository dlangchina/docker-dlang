FROM debian:sid

ENV GDC_VERSION 9.5.0-6

RUN apt-get update && \
    apt-get install -y gdc && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/* && \
    gdc --version
