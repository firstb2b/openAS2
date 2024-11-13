#!/bin/bash

# This script will reload the as2 container, bringing any new changes in
# Usage: ./scripts/reload-as2-container.sh
# Note: This is not required for partnership.xml changes

git fetch origin/main
git reset --hard origin/main
docker compose up -d --build openas2
