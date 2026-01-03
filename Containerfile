FROM centos:stream10

LABEL maintainer="Your Name <your@email.com>"
LABEL description="CentOS systemd-enabled container"
LABEL version="1.0"

RUN dnf update -y && \
    dnf install -y systemd systemd-libs sudo vim && \
    dnf clean all && \
    rm -rf /var/cache/dnf /var/log/*

RUN systemctl mask dev-mqueue.mount sys-fs-fuse-connections.mount \
    systemd-remount-fs.service systemd-tmpfiles-setup.service \
    dev-hugepages.mount sys-kernel-config.mount

VOLUME [ "/sys/fs/cgroup" ]

CMD [ "/usr/sbin/init" ]
