FROM alpine:3.4

RUN apk --update add bind

RUN mkdir -m 0755 -p /var/run/named && chown -R root:named /var/run/named
RUN mkdir -m 0755 -p /var/cache/bind && touch /var/cache/bind/docker-init && \
    chown -R named:named /var/cache/bind

COPY run.sh /
CMD ["/run.sh"]

VOLUME ["/etc/bind"]
VOLUME ["/var/cache/bind"]

EXPOSE 53