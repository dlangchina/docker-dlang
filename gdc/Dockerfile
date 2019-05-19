FROM fedora:30

ENV GDC_VERSION 9.1.1

ENV DMD_VERSION 2.086.0

RUN dnf install -y wget gcc-gdc libgphobos

RUN wget http://downloads.dlang.org/releases/2.x/2.086.0/dmd-${DMD_VERSION}-0.fedora.x86_64.rpm && rpm -ivh --nodeps dmd-${DMD_VERSION}-0.fedora.x86_64.rpm

RUN rm -rf dmd-*

RUN dnf autoremove && dnf clean all

RUN set -ex && \
	gdc  --version && \
	dub --version

