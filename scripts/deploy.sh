#!/bin/bash

zensical build

python3 scripts/python/update_copyright.py

docker buildx build -t website:latest .

docker compose -f $(find ~ -name website-docker-compose.yml -type f) up -d --force-recreate
