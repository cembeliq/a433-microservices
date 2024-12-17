#!/bin/bash

# Get current timestamp
timestamp=$(date '+%Y%m%d_%H%M%S')
log_file="logs_${timestamp}.txt"

# Save logs with timestamps to file
docker compose logs --timestamps > "${log_file}"

echo "Logs have been saved to ${log_file}"
