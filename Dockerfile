FROM alpine:3.5
RUN apk add --no-cache rsyslog
COPY . /
VOLUME "/var/log"
EXPOSE 514/tcp 514/udp
ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslogd.conf"]
