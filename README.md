# WizTools.org RESTClient via Docker

![github actions workflow](https://github.com/kaszarobert/restclient_docker/actions/workflows/docker-image.yml/badge.svg)

A simple Docker image that builds [RestClient](https://github.com/wiztools/rest-client).

Usage example (the current directory mounted to the container /app folder to open and save request and response files there):

```
docker container run -v $(pwd):/app --user $(id -u):$(id -g) -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix kaszarobert/restclient_docker:latest java -jar /application/restclient-ui.jar
```

```
docker container run -v $(pwd):/app --user $(id -u):$(id -g) -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix kaszarobert/restclient_docker:latest java -jar /application/restclient-cli.jar
```
