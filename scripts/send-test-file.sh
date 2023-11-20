#!/bin/bash

# This script will create a file in ./data/outbox/celosia with a filename incorporating the current timestamp
# Usage: ./scripts/send-test-file.sh

# Get the current timestamp
timestamp=$(date "+%Y%m%d%H%M%S")

# Continuing a FirstB2B tradition
quote="\"Help me, Obi-Wan Kenobi. You're my only hope.\" - Princess Leia"

# Define the file path
file_path="./data/outbox/celosia/test_message_${timestamp}.txt"

echo "Creating test file at $file_path..."

# Command to write the quote into the file
echo '$quote' > $file_path
