#!/bin/bash

# define variable for image name
image_name="item-app"

# define variable for image tag
image_tag="v1"

# define variable for username of the GitHub repository
github_username="cembeliq"

# build docker image using image name and image tag
docker build -t ${image_name}:${image_tag} .

# tag the image for GitHub Packages
docker tag ${image_name}:${image_tag} ghcr.io/${github_username}/${image_name}:${image_tag}

# list docker images on the local
docker images

# Check if GITHUB_TOKEN is set
if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_TOKEN environment variable is not set"
    exit 1
fi

# login to GitHub Packages
echo "$GITHUB_TOKEN" | docker login ghcr.io -u ${github_username} --password-stdin

# push docker image to GitHub Packages
docker push ghcr.io/${github_username}/${image_name}:${image_tag}