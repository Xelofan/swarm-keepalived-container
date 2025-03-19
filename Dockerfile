FROM alpine:3.21

# Keepalived version
# ARG KEEPALIVED_VERSION=2.3.1

RUN apk add --no-cache keepalived py3-pyaml
# Download, build and install Keepalived
# RUN apk --no-cache add \
#     autoconf \
#     curl \
#     gcc \
#     ipset \
#     ipset-dev \
#     iptables \
#     iptables-dev \
#     libnfnetlink \
#     libnfnetlink-dev \
#     libnl3 \
#     libnl3-dev \
#     make \
#     musl-dev \
#     openssl \
#     openssl-dev

# RUN curl -o keepalived.tar.gz -SL http://keepalived.org/software/keepalived-${KEEPALIVED_VERSION}.tar.gz \
#     && mkdir -p /container/keepalived-sources \
#     && tar -xzf keepalived.tar.gz --strip 1 -C /container/keepalived-sources \
#     && cd container/keepalived-sources \
#     && ./configure --disable-dynamic-linking \
#     && make && make install \
#     && cd - && mkdir -p /etc/keepalived \
#     && rm -f keepalived.tar.gz \
#     && rm -rf /container/keepalived-sources \
#     && apk --no-cache del \
#     autoconf \
#     gcc \
#     ipset-dev \
#     iptables-dev \
#     libnfnetlink-dev \
#     libnl3-dev \
#     make \
#     musl-dev \
#     openssl-dev

COPY ./container/tool /container/tool
COPY ./container/service /container/service

# Use baseimage install-service script
# https://github.com/osixia/container-baseimage/blob/main/image/tool/install-service
RUN python3 /container/tool/install-service

# Add default env variables
COPY ./container/environment /container/environment/99-default
