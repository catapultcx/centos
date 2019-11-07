FROM centos:centos8

LABEL maintainer="info@catapult.cx"
LABEL org.label-schema.description="Base centos 8 image"

ENV HOME /root
ENV LANG en_GB.UTF-8

RUN yum update -y && \
    yum install -y curl git tar unzip openssh epel-release wget langpacks-en_GB && \
    echo "alias ll='ls -h -l --color'" >> /etc/profile && \
    echo "LANG=\"en_GB.UTF-8\"" > /etc/sysconfig/i18n && \
    rm -rf /tmp/* && \
    yum clean all && \
    rm -rf /var/cache/yum

CMD /bin/bash
