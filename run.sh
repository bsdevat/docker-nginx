#!/bin/sh

sh ./remove.sh
sh ./stop.sh
echo Run nginx-dev as nginx-instance on http://localhost:8080 ...
docker run -d -p 8080:8080 -p8443:8443 --name nginx-instance nginx-dev
docker ps
