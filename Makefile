MAKEFLAGS += -j2

run-client:
	@echo "Running client..."
	@cd client && pnpm run dev

run-server:
	@echo "Running server..."
	@cd server && go run cmd/api/main.go

run: run-client run-server

seed:
	@echo "Seeding database..."
	@cd server/cmd/seed && go run main.go --env=.env.development

# make migrate-create name=migration_name
migrate-create:
	@echo "Creating migration..."
	@cd server && goose -s create $(name) sql -env=.env.development

migrate-up-dev:
	@echo "Running migrations..."
	@cd server && goose up -env=.env.development

migrate-down-dev:
	@echo "Rolling back migration..."
	@cd server && goose down -env=.env.development

migrate-status-dev:
	@echo "Checking migration status..."
	@cd server && goose status -env=.env.development

migrate-up-prod:
	@echo "Running migrations in production..."
	@cd server && goose up -env=.env.production

migrate-down-prod:
	@echo "Rolling back migration in production..."
	@cd server && goose down -env=.env.production