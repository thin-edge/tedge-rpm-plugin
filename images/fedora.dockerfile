FROM fedora:43

# Enforce proper /etc/shadow permissions
USER root
RUN chmod 600 /etc/shadow && chown root:root /etc/shadow

# install thin-edge.io
RUN curl -fsSL https://thin-edge.io/install.sh | sh -s

# install sm-plugin
COPY ./dist/*.rpm /tmp/
RUN dnf install -y /tmp/tedge-rpm-plugin*.rpm \
    && rm -f /tmp/*.rpm

# Set entry point
ENTRYPOINT ["/sbin/init"]
