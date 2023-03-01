# Stage 1: Install the build tools and deps
ARG VERSION=edge
ARG DOCKER_ARCH=arm32v7/
ARG ALPINE_ARCH=arm32v7/
FROM ${DOCKER_ARCH}alpine:$VERSION

ARG VERSION

RUN apk add --update-cache \
	alpine-sdk \
	gcc \
	make \
	musl-dev \
	automake \
	autoconf \
	libtool \
	bison \
	flex \
	glproto \
	libpthread-stubs \
	python3 \
    py3-libxml2 \
	py3-six \
    gettext \
    build-base \
	linux-headers \
	libpng-dev \
	mesa-dev \
	libdrm-dev \
	libxext-dev \
	eudev-dev \
	sysfsutils-dev \
	expat-dev \
	llvm15-dev \
	git \
  sudo
	
RUN adduser -D builder && \
	addgroup builder abuild && \
	mkdir -p /var/cache/distfiles && \
	chgrp abuild /var/cache/distfiles && \
	chmod g+w /var/cache/distfiles && \
	echo "builder  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers 

ENV HOME=/home/builder
	
USER builder
WORKDIR $HOME

RUN abuild-keygen -a -i -n

RUN git clone https://github.com/T110-pmOS/abuilds
	
RUN cd abuilds && \
	cd libetnaviv-dev && \
	abuild -r

RUN sudo apk add packages/abuilds/armv7/libetnaviv-dev*.apk

RUN cd abuilds && \
	cd mesa-etna && \
	abuild -r
