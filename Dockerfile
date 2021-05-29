FROM ubuntu:20.04
LABEL monandkey <satoru070505@gmail.com>

RUN apt update && apt install -y \
    tcpdump \
    iproute2 \
    iputils-ping

COPY tcpdump.sh /tmp/
RUN chmod +x /tmp/tcpdump.sh

ENTRYPOINT [ "/usr/sbin/tcpdump" ]
