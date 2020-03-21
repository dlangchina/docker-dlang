FROM debian:sid

ENV LDC_VERSION 1.20.1
ENV LDC_PATH /usr/local/ldc

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl wget gcc ca-certificates xz-utils libxml2 && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN set -ex && \
        wget https://github.com/ldc-developers/ldc/releases/download/v${LDC_VERSION}/ldc2-${LDC_VERSION}-linux-x86_64.tar.xz && \
        tar xvf ldc2-${LDC_VERSION}-linux-x86_64.tar.xz && \
        mv ldc2-${LDC_VERSION}-linux-x86_64 ${LDC_PATH} && \
        rm -rf ldc2*

ENV PATH="${LDC_PATH}/bin:${PATH}"
ENV LIBRARY_PATH="${LDC_PATH}/lib:${LIBRARY_PATH}"
ENV LD_LIBRARY_PATH="${LDC_PATH}/lib:${LD_LIBRARY_PATH}"

RUN chmod 755 -R $LDC_PATH

RUN set -ex && \
        ldc2 --version && \
        dub --version
