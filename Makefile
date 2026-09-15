.PHONY: help db-up db-down db-reset backup restore verify

help:
	@echo "Available commands:"
	@echo "  make db-up"
	@echo "  make db-down"
	@echo "  make db-reset"
	@echo "  make backup"
	@echo "  make restore BACKUP=<file>"
	@echo "  make verify"

db-up:
	docker compose -f database/docker-compose.yml up -d

db-down:
	docker compose -f database/docker-compose.yml down

db-reset:
	docker compose -f database/docker-compose.yml down -v
	docker compose -f database/docker-compose.yml up -d

backup:
	./scripts/backup.sh

restore:
	./scripts/restore.sh $(BACKUP)

verify:
	./scripts/verify.sh
