FROM alpine:edge

RUN	true && \
	apk add --no-cache --update postfix ca-certificates supervisor rsyslog bash && \
    apk add --no-cache --upgrade musl musl-utils && \
	(rm "/tmp/"* 2>/dev/null || true) && (rm -rf /var/cache/apk/* 2>/dev/null || true)

COPY	supervisord.conf /etc/supervisord.conf
COPY	run.sh /run.sh
RUN	chmod +x /run.sh
COPY	main.cf /etc/postfix/main.cf
COPY	rsyslog.conf /etc/rsyslog.conf

VOLUME	[ "/var/spool/postfix", "/etc/postfix" ]

USER	root
WORKDIR	/tmp

EXPOSE 587
ENTRYPOINT ["/run.sh"]
