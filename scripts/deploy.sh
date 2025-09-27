#!/bin/bash

hugo

docker buildx build -t website .
