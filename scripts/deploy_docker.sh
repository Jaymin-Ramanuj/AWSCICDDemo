#!/bin/bash

set -e

echo "Starting ECR Docker Deployment..."

# Set variables
AWS_REGION="us-east-1"
ACCOUNT_ID="646362345234"
REPOSITORY_NAME="test-docker-on-ec2"
IMAGE_TAG="latest"
IMAGE_URI="${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${REPOSITORY_NAME}:${IMAGE_TAG}"

# Authenticate to ECR
echo "Logging in to Amazon ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# Pull Docker image
echo "Pulling Docker image: $IMAGE_URI"
docker pull $IMAGE_URI

# Stop and remove any existing container
echo "Stopping existing container (if running)..."
docker stop Test-Docker-App || true
docker rm Test-Docker-App || true

# Run new container
echo "Running new container..."
docker run -d --name Test-Docker-App -p 80:80 $IMAGE_URI

echo "Deployment complete!"
