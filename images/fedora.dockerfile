FROM fedora:43
 
# install thin-edge.io
RUN curl -fsSL https://thin-edge.io/install.sh | sh -s

# install sm-plugin
COPY ./dist/*.rpm /tmp/
RUN dnf install -y /tmp/tedge-rpm-plugin*.rpm \
    && rm -f /tmp/*.rpm

# Set entry point
ENTRYPOINT ["/sbin/init"]
