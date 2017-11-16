FROM docker

RUN apk update && apk add --no-cache \
	git wget make py-pip bash

RUN pip install --upgrade pip
RUN pip install docker-compose

RUN mkdir -p /repos \
	&& cd repos
WORKDIR /repos

COPY ./clone.sh /repos/clone.sh
RUN chmod +x ./clone.sh

RUN cd /repos && ./clone.sh
