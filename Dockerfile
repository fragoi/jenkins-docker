FROM jenkins

## The Docker group ID
ARG docker_gid=999
## The Jenkins user
ARG user=jenkins

## Add Jenkins user to docker group
USER root
RUN groupadd -g ${docker_gid} docker &&\
    usermod -aG docker ${user}

## Drop back to regular user
USER ${user}
