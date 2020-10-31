FROM jenkins/jenkins

ARG docker_gid=999

USER root

## Install packages
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive \
  apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
  && rm -rf /var/lib/apt/lists/*

## Add Docker repository key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg \
  | apt-key add -

## Add Docker repository
RUN add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/debian \
  $(lsb_release -cs) \
  stable"

## Install Docker
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive \
  apt-get install -y --no-install-recommends \
    docker-ce-cli \
  && rm -rf /var/lib/apt/lists/*

## Add jenkins user to docker group
RUN groupadd -g ${docker_gid} docker \
  && usermod -aG docker jenkins

## Set timezone
RUN echo 'Europe/Rome' > /etc/timezone

USER jenkins
