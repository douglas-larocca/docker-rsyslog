FROM alpine:3.5
LABEL org.freenas.interactive="false" \
      org.freenas.version="3.2" \
      org.freenas.upgradeable="false" \
      org.freenas.expose-ports-at-host="true"	\
      org.freenas.autostart="true" \
      org.freenas.port-mappings="514:514/tcp,514:514/udp" \
      org.freenas.volumes="[                            \
          {                                             \
              \"name\": \"/var/log\",                   \
              \"descr\": \"log files\"                  \
          }                                             \
      ]"
RUN apk add --no-cache rsyslog
COPY . /
VOLUME "/var/log"
EXPOSE 514/tcp 514/udp
ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslogd.conf"]
