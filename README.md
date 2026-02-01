# 🚀 CloudOps Full-Stack Platform

Production-grade full-stack application deployed on AWS using Docker, Terraform, and GitHub Actions with automated CI/CD, monitoring, and infrastructure provisioning.

---

## 📌 Overview

This project demonstrates a real-world CloudOps/DevOps platform consisting of:

- React Frontend
- Flask Backend API
- PostgreSQL Database
- Nginx Reverse Proxy
- Docker Containerization
- GitHub Actions CI/CD
- Terraform Infrastructure as Code
- Prometheus Monitoring

The system is deployed on AWS EC2 and follows industry best practices for security, scalability, and automation.

---

## 🏗️ Architecture
User Browser
↓
AWS EC2 (Public IP)
↓
Nginx Reverse Proxy
↓
React Frontend
↓
Flask Backend API
↓
PostgreSQL Database


Infrastructure is provisioned using Terraform.

---

## ⚙️ Technology Stack

| Layer          | Technology              |
|----------------|--------------------------|
| Frontend       | React + Nginx            |
| Backend        | Flask + Gunicorn         |
| Database       | PostgreSQL               |
| Reverse Proxy  | Nginx                    |
| Containers     | Docker + docker-compose  |
| CI/CD          | GitHub Actions           |
| IaC            | Terraform                |
| Monitoring     | Prometheus + Grafana     |
| Cloud Provider | AWS EC2                  |

---

## ✨ Features

- Multi-container microservice architecture
- Automated CI/CD pipeline
- Infrastructure as Code with Terraform
- Secure environment configuration
- Reverse proxy with API routing
- Database persistence and backups
- Monitoring and observability
- Rollback and recovery scripts
- Development and production modes

---

## 📁 Project Structure
.
├── backend/
├── frontend/
├── nginx/
├── database/
├── monitoring/
├── scripts/
├── terraform/
├── docker-compose.yml
├── Makefile
└── README.md


---

## 🔐 Prerequisites

Before running this project, ensure you have:

- Docker & Docker Compose
- Terraform
- AWS CLI configured
- GitHub Account
- Docker Hub Account

---

## 🚀 Infrastructure Setup (Terraform)

### 1. Configure AWS

```bash
aws configure
```
2. Initialize Terraform
```bash
make tf-init
```

3. Plan Infrastructure
```bash
make tf-plan
```

4. Apply Infrastructure

```bash
make tf-apply
```

### Terraform will provision:
EC2 Instance
Security Group
Docker Environment

## ⚙️ Environment Setup
Create .env file:
```bash
cp .env.example .env
```
Edit values if required.

## ▶️ Run Locally (Production Mode)
```bash 
make build
make up
```

## Access:
http://<EC2-IP>

### 🧪 Development Mode
Run with hot reload:
```bash
make dev-up
```
Frontend: http://localhost:3000
Backend: http://localhost:5000

Stop:
```bash
make dev-down
```
### 🔄 CI/CD Workflow
On every push to main branch:
1. GitHub Actions is triggered
2. Builds frontend & backend images
3. Pushes images to Docker Hub
4. SSH deploys to EC2
5. Restarts containers
This enables zero-touch deployment.

### 📊 Monitoring
Prometheus is configured to scrape backend metrics.
Future integration with Grafana dashboards is supported.

### 💾 Database Backup
Manual backup:
```bash
make db-backup
```

Backup file is stored locally.

### 🔁 Deployment
Automatic (Recommended)
```bash
make deploy
```
Pushes code → triggers CI/CD.

Manual
```bash
make manual-deploy
```

Rollback
```bash
make rollback
```

### 📈 System Status
Check running services:
```bash
make status
```

View logs:
```bash
make logs
```