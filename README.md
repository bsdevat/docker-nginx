# BSDev.at nginx docker image

[![Build Status](https://travis-ci.org/bsdevat/docker-nginx.svg?branch=master)](https://travis-ci.org/bsdevat/docker-nginx)

This docker image will be used for serving PHP and other projects.
It's based on the idea of micro containers and should be able to run without
root privilege. This is a requirement to run on the Oracle OpenShift platform.

## Getting Started

These instructions will help you getting a copy of the project up and running on
your local machine for development and testing purposes.

### Installing

```
sudo docker pull bsdevat/nginx
```

### Basic Configuration

**TODO:** how to copy default nginx.conf and change config
how to enable https

### Running the image

Replace *<your-http-port>* with e.g. 80 to serve HTTP on the default port and *<your-https-port>* with 443.

Otherwise you can use 8080 and 8443 for alternative ports without the requirement to start it as root.

```
docker run -d -p <your-http-port>:8080 -p <your-https-port>:8443 --name nginx-instance bsdevat/nginx
```
* **-d**: Run container in background and print container ID
* **-p**: Publish a container's port(s) to the host. Format: *host:container*
* **--name**: Assign a name to the container

#### Running with a native network

If you want higher performance and run your container without the docker NAT,
you can use the following command.

```
docker run --network host bsdevat/nginx
```
The container now will use the ports from your host machine without port mapping
and without the time cost of translating the ports from host to container.

For more information about running a docker container, visit the link in the
[references section](#references).

#### Attach to the running image

The images is a minimal alpine linux and only offers an sh shell.
To attach your console to the container user following command.

```
docker exec -it nginx-instance sh
```

## Serving Content

### The Web Root

**TODO:** how to mount/link the docker web root to an external directory

```
docker run -d \
    -p <your-http-port>:8080 \
    -p <your-https-port>:8443 \
    -v /path/to/host/html:/usr/share/nginx/html:ro
    --name nginx-instance \
    bsdevat/nginx
```
With the *-v* option you can set the mount point of the html files and override
the docker image folder content.

### Serving PHP

**TODO:** how to link to a php fpm and a optimized config

## Secure your web server

If you run a public accessible nginx, consider some changes to harden your
configuration.

1. [nixCraft: Top 25 Nginx Web Server Best Security Practices](https://www.cyberciti.biz/tips/linux-unix-bsd-nginx-webserver-security.html)


## Build from Sources

```
docker build -t nginx-dev .
docker run -p 8080:8080 nginx-dev
```

Now you can open http://host-ip:8080. You can start the image with options
described in the section about [running nginx](#running-the-image) but with
your given name when you built it. In this case it's *nginx-dev*.

## References

1. [Stackoverflow: What is the runtime performance cost of a Docker container](https://stackoverflow.com/questions/21889053/what-is-the-runtime-performance-cost-of-a-docker-container)
1. [Docker Network](https://docs.docker.com/network/host/)
1. [Docker run command](https://docs.docker.com/engine/reference/commandline/run/)
1. [PurbleBooth: Markdown Template](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)

## Authors
* **Sebastian Brandner** [Web](https://bsdev.at) [GitHub](https://github.com/sebastianbrandner)
