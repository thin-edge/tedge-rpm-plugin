FROM opensuse/leap:15

RUN zypper install -y dbus-1 systemd-sysvinit sudo
RUN cp /usr/lib/systemd/system/dbus.service /etc/systemd/system/; \
    sed -i 's/OOMScoreAdjust=-900//' /etc/systemd/system/dbus.service \
    # Turn off as test packages aren't signed
    && echo "pkg_gpgcheck = off" >> /etc/zypp/zypp.conf

# install thin-edge.io
RUN curl -fsSL https://thin-edge.io/install.sh | sh -s

# install sm-plugin
COPY ./dist/*.rpm /tmp/
RUN zypper install -y /tmp/tedge-rpm-plugin*.rpm \
    && rm -f /tmp/*.rpm

# Set entry point
ENTRYPOINT ["/sbin/init"]
