@echo off

docker build -t hello-world-webapp .

FOR /F %%i IN ('docker ps -q -f "name=hello-web-container"') DO (
    echo Stopping existing container...
    docker stop hello-web-container
    docker rm hello-web-container
)

echo Starting new container...
docker run -d ^
  --name hello-web-container ^
  -p 8080:8080 ^
  -v "%cd%":/app ^
  -w /app ^
  -e FLASK_APP=app.py ^
  hello-world-webapp

echo Container started. Access the application at http://localhost:8080