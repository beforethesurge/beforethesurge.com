#!/bin/bash

read -p "DEV or PROD? (D/p): " user_choice
user_choice=$(echo "$user_choice" | tr "[:upper:]" "[:lower:]")
if [[ "$user_choice" == "d" || "$user_choice" == "" ]]; then
    ./scripts/build-site-dev.sh
elif [[ "$user_choice" == "p" ]]; then
    ./scripts/build-site-prod.sh
    ./scripts/build-container.sh
fi
