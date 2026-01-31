# ================================
# CloudOps Full-Stack Platform
# Makefile - DevOps Automation
# ================================

PROJECT_NAME=cloudops-platform
TERRAFORM_DIR=terraform

# -------------------------------
# Docker / App Commands
# -------------------------------

build:
	@echo "Building Docker images..."
	docker-compose build

up:
	@echo "Starting application..."
	docker-compose up -d

down:
	@echo "Stopping application..."
	docker-compose down

restart:
	@echo "Restarting application..."
	docker-compose down
	docker-compose up -d

logs:
	@echo "Showing logs..."
	docker-compose logs -f

ps:
	@echo "Running containers..."
	docker-compose ps


# -------------------------------
# Development Mode
# -------------------------------

dev-up:
	@echo "Starting dev environment..."
	docker-compose -f docker-compose.dev.yml up -d

dev-down:
	@echo "Stopping dev environment..."
	docker-compose -f docker-compose.dev.yml down


# -------------------------------
# Database Operations
# -------------------------------

db-backup:
	@echo "Backing up database..."
	./scripts/backup.sh

db-shell:
	@echo "Opening database shell..."
	docker exec -it project-1_db_1 psql -U admin appdb


# -------------------------------
# Deployment
# -------------------------------

deploy:
	@echo "Deploying via CI/CD..."
	git push origin main

manual-deploy:
	@echo "Manual deployment..."
	./scripts/deploy.sh

rollback:
	@echo "Rolling back deployment..."
	./scripts/rollback.sh


# -------------------------------
# Terraform (Infrastructure)
# -------------------------------

tf-init:
	@echo "Initializing Terraform..."
	cd $(TERRAFORM_DIR) && terraform init

tf-plan:
	@echo "Planning Infrastructure..."
	cd $(TERRAFORM_DIR) && terraform plan

tf-apply:
	@echo "Applying Infrastructure..."
	cd $(TERRAFORM_DIR) && terraform apply

tf-destroy:
	@echo "Destroying Infrastructure..."
	cd $(TERRAFORM_DIR) && terraform destroy


# -------------------------------
# Utilities
# -------------------------------

status:
	@echo "System Status"
	@docker ps
	@echo "--------------------"
	@cd terraform && terraform output || true


help:
	@echo ""
	@echo "CloudOps Platform - Available Commands"
	@echo ""
	@echo "Application:"
	@echo "  make build          Build containers"
	@echo "  make up             Start platform"
	@echo "  make down           Stop platform"
	@echo "  make restart        Restart platform"
	@echo "  make logs           View logs"
	@echo "  make ps             Show containers"
	@echo ""
	@echo "Development:"
	@echo "  make dev-up         Start dev mode"
	@echo "  make dev-down       Stop dev mode"
	@echo ""
	@echo "Database:"
	@echo "  make db-backup      Backup database"
	@echo "  make db-shell       Open DB shell"
	@echo ""
	@echo "Deployment:"
	@echo "  make deploy         Deploy via CI/CD"
	@echo "  make manual-deploy  Deploy manually"
	@echo "  make rollback       Rollback release"
	@echo ""
	@echo "Terraform:"
	@echo "  make tf-init        Init Terraform"
	@echo "  make tf-plan        Plan infra"
	@echo "  make tf-apply       Create infra"
	@echo "  make tf-destroy     Remove infra"
	@echo ""
