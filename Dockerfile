FROM alpine:3.15.0

RUN set -ex && apk add --no-cache dovecot dovecot-ldap dovecot-lmtpd dovecot-mysql dovecot-pop3d dovecot-pigeonhole-plugin
RUN set -ex && rm -fr /etc/dovecot/*
RUN set -ex && addgroup -g 1000 -S vmail && adduser -u 1000 -G vmail -S -D -h /var/vmail vmail

COPY entrypoint.sh /entrypoint.sh

VOLUME /var/vmail

EXPOSE 143/tcp 2525/tcp 4190/tcp 993/tcp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/dovecot", "-c", "/etc/dovecot/dovecot.conf", "-F"]
