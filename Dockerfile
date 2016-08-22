FROM alpine:3.1
RUN apk update && \
	apk add git
ADD ./repos .
RUN ./get_repos.sh

