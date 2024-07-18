#!/bin/bash

DOCKER_USERNAME="andre562"
DOCKER_PASSWORD="redacted"

echo $DOCKER_ACCESS_TOKEN | docker login --username $DOCKER_USERNAME --password-stdin

docker build -t andre562/stateless_app_backend_uploader ./backend-uploader/

docker build -t andre562/stateless_app_frontend ./frontend/

docker build -t andre562/stateless_app_image_processor ./backend-image-processor/

docker push andre562/stateless_app_backend_uploader:latest

docker push andre562/stateless_app_frontend:latest

docker push andre562/stateless_app_image_processor:latest

echo "Docker images built and pushed successfully successfully"