FROM ubuntu:16.04

## User and group IDs
ARG uid=1000
ARG gid=1000

## Upgrade system
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

## Install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
        apt-utils software-properties-common git maven

## Install Java
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-add-repository -y ppa:webupd8team/java && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java8-installer && \
    rm -rf /var/cache/oracle-jdk8-installer

## Clean apt cache
RUN rm -rf /var/lib/apt/lists/*

## Set timezone
RUN echo 'Europe/Madrid' > /etc/timezone

## Create group and user
RUN groupadd -g ${gid} jenkins && \
    useradd -u ${uid} -g ${gid} -m -d /home/jenkins jenkins

WORKDIR /home/jenkins

## Git settings
#ADD git/gitconfig .gitconfig
#RUN chown jenkins:jenkins .gitconfig

## Maven settings
#ADD m2/settings.xml .m2/settings.xml
#RUN chown -R jenkins:jenkins .m2

## SSH settings
#ADD ssh/* .ssh/
#RUN chown -R jenkins:jenkins .ssh && \
#    chmod -R go-rwx .ssh

USER jenkins
