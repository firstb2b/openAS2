#!/bin/bash

# This script will reload the as2 container, bringing any new changes in
# Usage: ./scripts/reload-as2-container.sh
# Note: This is not required for partnership.xml changes

git reset --hard origin/main
git pull

docker compose down
docker compose pull openas2
docker compose up -d --build openas2
