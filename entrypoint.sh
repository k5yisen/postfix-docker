#!/bin/sh
set -e

# Create all required spool directories
for dir in hold incoming active deferred corrupt; do
    mkdir -p /var/spool/postfix/$dir
    chown postfix:postfix /var/spool/postfix/$dir
done

# Keep resolver/NSS files available inside the Postfix chroot
mkdir -p /var/spool/postfix/etc
for f in hosts resolv.conf nsswitch.conf services; do
    if [ -f /etc/$f ]; then
        cp -f /etc/$f /var/spool/postfix/etc/$f
    fi
done

# Start rsyslog
rsyslogd

# Start postfix
postfix start

# Keep container running and tail logs
tail -f /var/log/mail.log
