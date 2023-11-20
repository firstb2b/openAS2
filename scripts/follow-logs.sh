#!/bin/bash

# This script will print the latest logs to stdout and continue to follow the logs
# Usage: ./scripts/follow-logs.sh
# You can safely exit here with a CTRL + C

docker compose logs -f openas2
