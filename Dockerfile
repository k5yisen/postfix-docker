FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y postfix mailutils rsyslog && \
    rm -rf /var/lib/apt/lists/*

# Ensure Postfix chroot has resolver and NSS files so DNS lookups work
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY main.cf /etc/postfix/main.cf
COPY sender_canonical /etc/postfix/sender_canonical
COPY generic /etc/postfix/generic
COPY header_checks /etc/postfix/header_checks

ENV timezone=Europe/Istanbul
RUN ln -snf /usr/share/zoneinfo/$timezone /etc/localtime && echo $timezone > /etc/timezone

ENTRYPOINT ["/entrypoint.sh"]
