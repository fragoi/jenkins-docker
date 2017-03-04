FROM jenkins

## The Docker group ID
ARG docker_gid=999

## Add Jenkins user to docker group
USER root
RUN groupadd -g ${docker_gid} docker &&\
    usermod -aG docker jenkins

## Drop back to regular user
USER jenkins
