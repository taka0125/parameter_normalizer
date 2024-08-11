DOCKER_COMPOSE = docker compose

help:
	@grep "^[a-zA-Z][a-zA-Z0-9\-\/\_]*:" -o Makefile | grep -v "grep" | sed -e 's/^/make /' | sed -e 's/://'
build:
	$(DOCKER_COMPOSE) build
up:
	$(DOCKER_COMPOSE) up -d
down:
	$(DOCKER_COMPOSE) stop
restart:
	$(MAKE) down
	$(MAKE) up
ps:
	$(DOCKER_COMPOSE) ps
convert:
	$(DOCKER_COMPOSE) convert
bundle/install: up
	$(DOCKER_COMPOSE) exec ruby bash -c 'bundle install'
ruby/bash: up
	$(DOCKER_COMPOSE) exec ruby bash
ruby/rspec: up
	$(DOCKER_COMPOSE) exec ruby bash -c 'bundle exec rspec'
ruby/appraisal/generate: up
	$(DOCKER_COMPOSE) exec ruby bash -c 'bundle exec appraisal generate'
gem/release:
	@read -p "Enter OTP code: " otp_code; \
	gh workflow run release.yml -f rubygems-otp-code="$$otp_code"
console: up
	$(DOCKER_COMPOSE) exec ruby bash -c './bin/console'
