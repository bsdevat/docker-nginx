# https://hub.docker.com/_/nginx/
# latest nginx alpine image
FROM nginx:alpine

LABEL maintainer="Sebastian Brandner <admin@bsdev.at>"


COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/conf.d/default.conf

# default webroot /usr/share/nginx/html
COPY htdocs/index.html /usr/share/nginx/html/index.html
VOLUME /usr/share/nginx/html

# nginx will serve HTTP and HTTPS on high ports
EXPOSE 8080
EXPOSE 8443
