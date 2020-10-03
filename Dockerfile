FROM jenkins/jenkins

USER root

## Update packages
RUN apt-get update

## Install packages
RUN DEBIAN_FRONTEND=noninteractive \
	apt-get install -y \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg-agent \
		software-properties-common

## Add Docker repository key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg \
	| apt-key add -

## Add Docker repository
RUN add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/debian \
		$(lsb_release -cs) \
		stable" \
	&& apt-get update

## Install Docker
RUN DEBIAN_FRONTEND=noninteractive \
	apt-get install -y \
		docker-ce \
		docker-ce-cli \
		containerd.io

## Clean apt cache
RUN rm -rf /var/lib/apt/lists/*

## Add jenkins user to docker group
RUN usermod -aG docker jenkins

USER jenkins
