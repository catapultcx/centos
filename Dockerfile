FROM centos:centos8

LABEL maintainer="info@catapult.cx"
LABEL org.label-schema.description="Base centos 8 image"

ARG USER=app
ARG GROUP=app
ARG UID=1000
ARG GID=1000
ARG APP_HOME=/home/app

RUN groupadd -g ${GID} ${GROUP} && \
    useradd -u ${UID} -g ${GID} -m -d ${APP_HOME} -s /bin/bash ${USER} && \
    yum update -y && \
    yum install -y curl git tar unzip openssh epel-release wget langpacks-en_GB && \
    echo "alias ll='ls -h -l --color'" >> /etc/bashrc && \
    echo "LANG=\"en_GB.UTF-8\"" > /etc/sysconfig/i18n && \
    echo "LANG=en_GB.UTF-8" > /etc/locale.conf && \
    rm -rf /tmp/* && \
    yum clean all && \
    rm -rf /var/cache/yum

ENV DEFAULT_USER=${USER}
USER ${USER}
WORKDIR ${APP_HOME}

CMD /bin/bash
