FROM registry.access.redhat.com/ubi8/ubi:latest

# Install required packages
# RUN dnf install -y sudo wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf install -y sudo wget curl
RUN wget -O /etc/yum.repos.d/epel.repo https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm \
    && rpm -ivh /etc/yum.repos.d/epel.repo \
    && yum install -y epel-release


RUN curl -LO https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/l/libwebsockets-3.0.1-2.el7.x86_64.rpm \
    && dnf install -y libwebsockets-3.0.1-2.el7.x86_64.rpm

RUN curl -LO https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/m/mosquitto-1.6.10-1.el7.x86_64.rpm \
    && dnf install -y mosquitto-1.6.10-1.el7.x86_64.rpm
 
RUN yum -y upgrade
# RUN yum -y install mosquitto_x86_64
# Download and run Thin Edge installation scripts
RUN wget -O - thin-edge.io/install.sh | sh -s
RUN wget -O - thin-edge.io/install-services.sh | sh -s

# Copy files
COPY ./images/files/bootstrap.sh /usr/bin/
COPY ./dist/*.rpm /tmp/

# Install RPM packages
RUN yum localinstall -y /tmp/tedge-rpm-plugin*.rpm

# Cleanup unnecessary files
RUN rm -rf /tmp/*

# Set entry point
ENTRYPOINT ["/sbin/init"]
