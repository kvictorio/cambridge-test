#!/bin/bash

docker build -t hello-world-webapp .

if [ "$(docker ps -q -f name=hello-web-container)" ]; then
    echo "Stopping and removing existing container..."
    docker stop hello-web-container
    docker rm hello-web-container
fi

echo "Starting new container..."
docker run -d \
  --name hello-web-container \
  -p 8080:8080 \
  -v "$(pwd)":/app \
  -w /app \
  -e FLASK_APP=app.py \
  hello-world-webapp

echo "Container started. Access the application at http://localhost:8080"

if [ "$(docker ps -q -f name=hello-web-container)" ]; then
    echo "Container is running successfully."
    exit 0
else
    echo "Container failed to start."
    exit 1
fi