# Use CentOS Stream 10 as base

FROM centos:stream10

# Set container metadata
#LABEL maintainer="Your Name <your@email.com>"
#LABEL description="CentOS systemd-enabled container"

# Install systemd and some basic utilities
RUN dnf install -y systemd systemd-libs sudo vim \
    && dnf clean all \
    && rm -rf /var/cache/dnf

# Enable systemd inside the container
VOLUME [ "/sys/fs/cgroup" ]

# Set default command to run systemd
CMD [ "/usr/sbin/init" ]

