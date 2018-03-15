# https://hub.docker.com/_/nginx/
# latest nginx alpine image
FROM nginx:alpine

LABEL maintainer="Sebastian Brandner <admin@bsdev.at>"

# nginx will serve HTTP and HTTPS on high ports
EXPOSE 8080
EXPOSE 8443
