FROM alpine

ENV TERM=screen-256color
ENV LANG=C.UTF-8
ENV IRC_UID=9000
ENV IRC_GID=9000

ADD run.sh /

RUN apk -U upgrade && apk add \
    weechat \
    su-exec \
    shadow \
    && mkdir /weechat \
    && addgroup -g $IRC_GID -S weechat \
    && adduser -u $IRC_UID -D -S -h /weechat -s /sbin/nologin -G weechat weechat \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

VOLUME /weechat

WORKDIR /weechat

EXPOSE 9001

ENTRYPOINT ["/run.sh"]
CMD ["--dir /weechat"]
