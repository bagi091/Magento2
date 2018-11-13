# Makefile

args = `arg="$(filter-out $(firstword $(MAKECMDGOALS)),$(MAKECMDGOALS))" && echo $${arg:-${1}}`

%:
	@:

up:
	@docker-compose up -d && \
    version=$(git describe --tags $(git rev-list --tags --max-count=1))

stop:
	@docker-compose stop

down:
	@docker-compose down -v

exec:
	@if [ -z "$(call args)" ]; then \
		docker-compose exec --user www-data apache bash; \
	else \
		docker-compose exec --user $(call args) apache bash; \
	fi;

xdebug:
	@docker-compose exec --user root apache xdebug
