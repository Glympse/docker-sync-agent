#!/bin/sh

# App name/home registry
REGISTRY_URL=registry.enterprise.glympse.com
IMAGE_NAME=tools/sync-agent

# Helpers
IMAGE_TAG=$(git rev-parse --short HEAD)
TAGGED_IMAGE=$REGISTRY_URL/$IMAGE_NAME:$IMAGE_TAG

# Build the image
docker build -t $IMAGE_NAME .

# Mark image with registry URL and tag
docker tag -f $IMAGE_NAME $TAGGED_IMAGE

# Push image to repote registry
docker push $TAGGED_IMAGE
