                                            MULTI-STAGE DOCKER CONTAINERIZATION & OPTIMIZATION

**Project Overview**:

This project demonstrates Docker-based containerization of a Python web application using a multi-stage build. Docker Compose is used to manage the web application and PostgreSQL database.



**Key Features**:

->Multi-stage Docker build for a lightweight image

->Non-root user for improved container security

->Docker Compose for application and database orchestration

->Application and database health checks

->Persistent PostgreSQL storage

->.dockerignore for build optimization



**Project Files**:

-Dockerfileapp.py

-requirements.txt

-docker-compose.yml

-.dockerignore



**How to Run**:

Build and start the containers:

docker compose up --build -d

Open the application:

http://localhost:8000

Check application health:

http://localhost:8000/health

Check container status:

docker compose ps

Stop the containers:

docker compose down


**Security**:

The application runs as a non-root user. Replace the example database password with a secure secret before production use.


**Testing Status**:

->Docker image build: Passed in GitHub Actions

->Application health endpoint: Passed in GitHub Actions

->Docker Compose with PostgreSQL: Configuration added; separate runtime testing is pending.

->Image size target (under 150 MB): Not yet verified.

**Conclusion**:

This project provides a foundation for secure, lightweight, and maintainable containerized application deployment.
