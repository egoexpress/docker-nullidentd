FROM gizmotronic/alpine-build:3.6

RUN apk add --no-cache --update curl unzip \
    && rm -rf /var/cache/apk/*

WORKDIR	/build

RUN curl -LO 'https://github.com/gizmotronic/nullidentd/archive/master.zip' \
    && unzip -o master.zip \
    && gcc -s -Os -D_POSIX_SOURCE -std=c99 nullidentd-master/nullidentd.c -o nullidentd

FROM alpine:3.6

ARG user=ident
ARG workdir=/tmp

RUN apk add --no-cache --update busybox-initscripts \
    && rm -rf /var/cache/apk/* \
    && adduser -u 10000 -h ${workdir} -D -S ${user}

COPY --from=0 /build/nullidentd /usr/sbin/nullidentd

COPY files/inetd.conf /etc/inetd.conf

COPY files/services /etc/services

EXPOSE 113

ENTRYPOINT [ "inetd", "-fe" ]
