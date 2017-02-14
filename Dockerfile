FROM alpine
MAINTAINER Santa Claus <job@dorry.io>

ENV SS_VER 2.5.6
ENV SS_URL https://github.com/shadowsocks/shadowsocks-libev/archive/v$SS_VER.tar.gz
ENV SS_DIR /shadowsocks-libev-$SS_VER
ENV SS_DEP autoconf build-base libtool linux-headers asciidoc xmlto zlib-dev

RUN apk update && \
    apk upgrade && \
    apk add --update bash curl python openssl-dev && \
    # get shadowsocks-libev
    curl -sSL "$SS_URL" | tar -xzv && \
    apk del --purge curl

# build shadowsocks-libev
WORKDIR "$SS_DIR"
RUN apk add --update $SS_DEP pcre-dev && \
    ./configure && \
    make && \
    make install && \
    # clear build dependency
    apk del --purge $SS_DEP

# clear build dependency
WORKDIR /
RUN rm -rf $SS_DIR && \
    apk del --purge $SS_DEP && \
    rm -rf /var/cache/apk/*

# clean build dependency
WORKDIR /
RUN rm -rf $SS_DIR

ADD init ./

ENTRYPOINT ./init