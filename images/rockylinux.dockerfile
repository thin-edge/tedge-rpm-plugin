FROM rockylinux:9-minimal

ENV container docker
RUN microdnf -y install sudo ca-certificates
# see https://hub.docker.com/_/rockylinux
# RockyLinux:9 missing /usr/sbin/init -> ../lib/systemd/systemd
#  see https://github.com/rocky-linux/sig-cloud-instance-images/issues/39
RUN [ ! -f /usr/sbin/init ] && microdnf -y install systemd;
RUN ([ -d /lib/systemd/system/sysinit.target.wants ] && cd /lib/systemd/system/sysinit.target.wants/ && for i in *; do [ $i == \
    systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

# install thin-edge.io
RUN curl -fsSL https://thin-edge.io/install.sh | sh -s

# rockylinux minimal uses a single cert.pem file instead of the ssl directory
RUN tedge config set c8y.root_cert_path /etc/ssl/cert.pem

# install sm-plugin (microdnf does not support installing from file)
COPY ./dist/*.rpm /tmp/
RUN rpm -i /tmp/tedge-rpm-plugin*.rpm \
    && rm -f /tmp/*.rpm

# Set entry point
ENTRYPOINT ["/usr/sbin/init"]