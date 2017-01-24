FROM alpine
MAINTAINER Santa Claus <job@dorry.io>
ENV SS_VER 2.5.6
ENV SS_URL https://github.com/shadowsocks/shadowsocks-libev/archive/v$SS_VER.tar.gz
ENV SS_DIR shadowsocks-libev-$SS_VER
ENV SS_DEP autoconf build-base libtool linux-headers

# build shadowsocks-libev
RUN apk update && \
    apk upgrade && \
    apk add --update $SS_DEP openssl-dev && \
    apk add --update bash vim curl

RUN curl -sSL "$SS_URL" | tar -xvz

WORKDIR "$SS_DIR"
RUN ./configure && \
    make install

# clear build dependency
WORKDIR /
RUN rm -rf $SS_DIR && \
    apk del --purge $SS_DEP && \
    rm -rf /var/cache/apk/*

ADD init ./

ENTRYPOINT ./init
