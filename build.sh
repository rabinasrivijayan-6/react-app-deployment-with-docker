#!/bin/bash

#login into DockerHub:
docker login -u $DOCKER_USERNAME -p $DOCKER_PASS

#stopping existing container:
docker stop react
docker rm react

#building a image:
docker build -t react-ci/cd .

#running a container from the created image:
docker run -d  react-ci/cd

#pushing the image to dockerhub:
docker tag react-ci/cd ravivarman46/react-app:ci-cd
docker push ravivarman46/react-app:ci-cd
