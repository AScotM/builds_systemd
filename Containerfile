FROM rockylinux:9

RUN dnf update -y && \
    dnf install -y systemd && \
    dnf clean all && \
    rm -rf /var/cache/dnf

VOLUME [ "/sys/fs/cgroup" ]

CMD [ "/usr/sbin/init" ]
