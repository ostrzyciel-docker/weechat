#!/bin/sh

usermod -o -u "$IRC_UID" weechat
groupmod -o -g "$IRC_GID" weechat

chown -R weechat:weechat /weechat
exec su-exec weechat /usr/bin/weechat "$@"
