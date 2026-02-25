#!/bin/bash

zensical build

docker buildx build -t website:latest .

docker compose -f $(find ~ -name website-docker-compose.yml -type f) up -d --force-recreate
