FROM opensuse/tumbleweed:latest

# Enforce proper /etc/shadow permissions
USER root
RUN chmod 600 /etc/shadow && chown root:root /etc/shadow

RUN zypper install -y systemd sudo awk
# Turn off as test packages aren't signed
RUN echo "Disabling gpg check for testing" \
    && echo "gpgcheck = off" >> /etc/zypp/zypp.conf.d/disable-gpg.conf \
    && echo "repo_gpgcheck = off" >> /etc/zypp/zypp.conf.d/disable-gpg.conf \
    && echo "pkg_gpgcheck = off" >> /etc/zypp/zypp.conf.d/disable-gpg.conf

# install thin-edge.io
RUN curl -fsSL https://thin-edge.io/install.sh | sh -s

# install sm-plugin
COPY ./dist/*.rpm /tmp/
RUN zypper install -y /tmp/tedge-rpm-plugin*.rpm \
    && rm -f /tmp/*.rpm

# Set entry point
ENTRYPOINT ["/sbin/init"]
