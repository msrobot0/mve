SHELL=/bin/bash
COMPOSE_RUN = docker-compose run --rm base

.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


.PHONY: build
build: ## rebuild docker container & build node_modules
	docker-compose build && ${COMPOSE_RUN} make _build
_build:
	yarn install


.PHONY: compile
compile: ## compile via truffle
	${COMPOSE_RUN} make _compile
_compile:
	truffle compile


.PHONY: local
local: ## to get the local blockchain
	${COMPOSE_RUN} make _local
_local:
	truffle develop


.PHONY: deploy
deploy: ## deploy to prod
	${COMPOSE_RUN} make _deploy
_deploy:
	deploy


.PHONY: sh
sh: ## shell into the container for local debug
	${COMPOSE_RUN}
