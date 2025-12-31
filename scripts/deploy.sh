#!/bin/bash

hugo

docker rmi website
docker buildx build -t website .
