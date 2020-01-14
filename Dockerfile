FROM centos:centos8

LABEL maintainer="info@catapult.cx"
LABEL org.label-schema.description="Base Centos 8 image"

RUN yum update -y && \
    yum install -y curl langpacks-en_GB && \
    echo "alias ll='ls -h -l --color'" >> /etc/bashrc && \
    echo "LANG=\"en_GB.UTF-8\"" > /etc/sysconfig/i18n && \
    echo "LANG=en_GB.UTF-8" > /etc/locale.conf && \
    rm -rf /tmp/* && \
    yum clean all && \
    rm -rf /var/cache/yum

CMD /bin/bash
