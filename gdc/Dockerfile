FROM buildpack-deps:buster

ENV GDC_VERSION 8

RUN apt-get update && apt-get install -y --no-install-recommends curl wget libevent-dev dub gdc-${GDC_VERSION} && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apt/*

RUN set -ex && \
	ln -s /usr/bin/gdc-${GDC_VERSION} /usr/bin/gdc && \
	gdc  --version && \
	dub --version

