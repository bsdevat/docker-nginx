#!/bin/sh

echo Stop nginx-instance container ...
docker stop nginx-instance 2>/dev/null
docker ps -a
