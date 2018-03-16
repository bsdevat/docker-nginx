#!/bin/sh

sh ./remove.sh
sh ./remove-image.sh

echo Build nginx-dev image ...
docker build -t nginx-dev .
