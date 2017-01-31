FROM alpine:3.3

ARG user=ident
ARG workdir=/tmp

RUN apk add --no-cache --update busybox-initscripts \
    && rm -rf /var/cache/apk/* \
    && adduser -u 10000 -h ${workdir} -D -S ${user}

COPY nullidentd /usr/sbin/nullidentd

COPY files/inetd.conf /etc/inetd.conf

COPY files/services /etc/services

EXPOSE 113

ENTRYPOINT [ "inetd", "-fe" ]
