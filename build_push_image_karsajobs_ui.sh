#!/bin/bash

# Navigate to the directory containing the Dockerfile
cd "$(dirname "$0")"

# Build the Docker image
docker build -t cembeliq/karsajobs-ui:latest .

# Tags it for GitHub Container Registry
docker tag cembeliq/karsajobs-ui:latest ghcr.io/cembeliq/karsajobs-ui:latest

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Docker image built successfully."
else
    echo "Failed to build Docker image."
    exit 1
fi

# Log in to GitHub Package Registry
echo $GITHUB_TOKEN | docker login ghcr.io -u cembeliq --password-stdin

if [ $? -ne 0 ]; then
    echo "Failed to log in to GitHub Package Registry."
    exit 1
fi

# Push the Docker image to GitHub Package Registry
docker push ghcr.io/cembeliq/karsajobs-ui:latest

if [ $? -eq 0 ]; then
    echo "Docker image pushed successfully to GitHub Package Registry."
else
    echo "Failed to push Docker image to GitHub Package Registry."
    exit 1
fi
