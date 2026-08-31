# Frontend Standard Template Makefile
# Mirrors the package.json scripts for common development and CI tasks.
# See the backend standard Makefile for the project-wide convention.
#
# NOTE: Make targets use hyphens (e.g. test-coverage) rather than the colons
# used in pnpm script names, because ':' is reserved Make syntax. Each target
# invokes the canonical pnpm script it mirrors.

COMPOSE := docker compose

.PHONY: help install dev build preview typecheck lint format test test-coverage test-e2e ci docker-build docker-up docker-down docker-logs docker-status docker-redeploy

help: ## Show this help message
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z][a-zA-Z0-9_.-]*:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies (pnpm install)
	pnpm install

dev: ## Start the Vite development server
	pnpm dev

build: ## Type-check and bundle the app into dist/
	pnpm build

preview: ## Serve the production build locally
	pnpm preview

typecheck: ## Run the TypeScript type checker
	pnpm typecheck

lint: ## Run Biome and ESLint
	pnpm lint

format: ## Format the codebase with Biome
	pnpm format

test: ## Run unit and component tests (Vitest)
	pnpm test

test-coverage: ## Run tests with coverage report
	pnpm test:coverage

test-e2e: ## Run Playwright end-to-end tests
	@echo "Note: run 'pnpm exec playwright install' first if browsers are missing."
	pnpm test:e2e

ci: ## CI gate: lint + typecheck + tests with coverage + build
	pnpm lint
	pnpm typecheck
	pnpm test:coverage
	pnpm build

docker-build: ## Build the Docker image
	$(COMPOSE) build

docker-up: ## Start the container (build + background)
	$(COMPOSE) up --build -d

docker-down: ## Stop and remove the container
	$(COMPOSE) down

docker-logs: ## Tail container logs
	$(COMPOSE) logs -f

docker-status: ## Show container status
	$(COMPOSE) ps

docker-redeploy: ## Rebuild and restart in one command
	$(COMPOSE) up --build -d
