# syntax = docker/dockerfile:1.0-experimental
FROM docker.io/mgoltzsche/podman:latest
LABEL Maintainer="Pichate Ins <pichate.ins[at]outlook.com>"
LABEL Name="Pichate Ins"
LABEL Version="v0.2"

RUN apk add --virtual .build-deps \
        libffi \
		gcc \
		libffi-dev \
	    musl-dev \
		openssl-dev \
		py3-cffi \
		python3-dev 

RUN apk --update add --no-cache \
		docker \
	    python3 \
        py3-pip \
        git \
		zsh \
	    py3-virtualenv 

RUN virtualenv -p /usr/bin/python3 /root/python3env

RUN source /root/python3env/bin/activate \
    && pip install --upgrade pip \
    && pip3 install pipenv ansible-bender ansible

RUN apk del .build-deps
COPY  entrypoint.sh /
WORKDIR /usr/src

ENTRYPOINT ["/entrypoint.sh"]
