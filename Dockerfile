FROM alpine:3.8

RUN apk --no-cache add openssh-client bash jq \
    && mkdir -p /opt/resource

COPY . /opt/resource
