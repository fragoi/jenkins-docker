# jenkins-docker

This project contains a docker file to build a Jenkins with Docker installed,
and a docker compose file to start it so it uses the docker from the host.

## Make the build environment

* Install Docker (https://www.docker.com/).
* Install Docker Compose (https://docs.docker.com/compose/).
* Build Jenkins:
  ```
  docker-compose build
  ```
* Run Jenkins:
  ```
  docker-compose up
  ```
* Visit http://localhost and follow instructions. Install recomended plugins.

## buildbox

This image is used by Jenkins for the builds.

Build the buildbox:
```
docker build -t buildbox ./buildbox
```
