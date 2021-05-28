FROM almalinux/almalinux
LABEL monandkey <satoru070505@gmail.com>

RUN yum update -y \
    && yum install -y tcpdump procps

COPY tcpdump.sh /tmp/
RUN chmod +x /tmp/tcpdump.sh

ENTRYPOINT ["/usr/sbin/tcpdump"]
