FROM buildpack-deps:stretch

ENV DMD_VERSION 2.087.0

RUN apt-get update && apt-get install -y --no-install-recommends curl wget libevent-dev && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apt/*

RUN set -ex && \
	wget http://downloads.dlang.org/releases/2.x/${DMD_VERSION}/dmd_${DMD_VERSION}-0_amd64.deb && \
	dpkg -i dmd_${DMD_VERSION}-0_amd64.deb && \
	rm -rf dmd* && \
	dmd --version && \
	dub --version

