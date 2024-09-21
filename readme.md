# **Hello World Web Application with GitHub Actions CI/CD**

This repository is a test for Cambridge that contains a simple Python Flask-based web application that prints "Hello Universe" and runs inside a Docker container. The project also includes GitHub Actions CI/CD workflows that automate the building, testing, and pull request creation process when changes are committed to the **dev** branch.

## **Table of Contents**

- [**Hello World Web Application with GitHub Actions CI/CD**](#hello-world-web-application-with-github-actions-cicd)
  - [**Table of Contents**](#table-of-contents)
  - [**Application Overview**](#application-overview)
    - [**Features**](#features)
  - [**Prerequisites**](#prerequisites)
    - [**1. Docker**](#1-docker)
    - [**2. Git**](#2-git)
  - [**Running the application**](#running-the-application)
  - [**CI/CD Pipeline**](#cicd-pipeline)
  - [**Updating the Application**](#updating-the-application)
    - [**Pythong Application app.py**](#pythong-application-apppy)
    - [**Docker file**](#docker-file)
    - [**PRs and Merging**](#prs-and-merging)
- [**Thankyou!**](#thankyou)

---

## **Application Overview**

A test application for Cambridge which is built in a minimal Python web server that runs using [Flask](https://flask.palletsprojects.com/). It is packaged inside a Docker container for ease of deployment. 

### **Features**

- Simple "Hello World" web page.
- Dockerized for easy container-based deployment.
- GitHub Actions CI/CD pipeline to:
  - Build and test the Docker container.
  - Automatically create a pull request from the **dev** branch to the **main** branch if tests pass.

---

## **Prerequisites**

Ensure you have the following installed before setting up the application:

### **1. Docker**

- **Docker** is required to build and run the application in a container.
  - [Install Docker for Windows](https://docs.docker.com/desktop/windows/install/)
  - [Install Docker for Linux](https://docs.docker.com/engine/install/)

You can check if Docker is installed by running:

```bash
docker --version
```

### **2. Git**
- **Git** is required to clone the repository and manage version control.
  - [Install Git for Windows](https://git-scm.com/download/win)
  - [Install Git for Linux](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

You can check if Git is installed by running:

```bash
git --version
```

## **Running the application**

You can run the application by using the batch or sh file included in the repository
    - start.bat (for Windows)
    - start.sh (for Linux/Unix/Mac)

## **CI/CD Pipeline**
**Workflow Overview**
This repository uses GitHub Actions to automate the following steps:
    - Build and Test: When you push a commit to the dev branch, the pipeline builds the Docker image and runs tests to ensure the container works as expected.
    - Create Pull Request: If all tests pass, a pull request is automatically created from dev to main, awaiting approval for merging.

**Pipeline Triggers**
    - Push to Dev Branch: Any push to the dev branch triggers the CI/CD workflow.
    - Manual Approval: After tests pass, the workflow automatically creates a pull request for merging the changes from dev into main.

**GitHub Actions Permissions**
    - There's also a requirement for the repository to "Allow GitHub Actions to create and approve pull requests"

## **Updating the Application**

### **Pythong Application app.py**
To update the application, you can simply make changes to the app.py:

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello Universe"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

### **Docker file**

These are the stops on the Dockerfile that creates the docker image and the container

```bash
FROM python:3.9.20-slim

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=8080

CMD ["python", "-m", "flask", "run", "--reload"]
```

The FLASK_APP needs to be dictated in the *start.bat* or *start.sh* (Depending on your OS) file.
You can either run this environmental variable manually with docker run -e FLASK_APP=app.py or you can use the *start.bat* or *start.sh*

### **PRs and Merging**
  - Create and push commits to the **dev** branch and it will automatically run a pipeline that will test the application.
  - A PR will automatically be created from the **dev** branch to the **main** branch
  - The **main** branch will have to manually approve the merge request before it is merged to the **main** branch

# **Thankyou!**