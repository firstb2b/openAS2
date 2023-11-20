#!/bin/bash

# This script will give you a bash shell into your running container
# To exit, press CRTL + D
# Usage: ./scripts/app-bash.sh

# Run the id fetching script in this same folder ($0 => current script filepath)
container_id=$($(dirname "$0")/get_app_container_id.sh)

echo "Hopping into app container with id $container_id..."
docker exec -it $container_id bash
