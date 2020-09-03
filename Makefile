.SILENT:
.DEFAULT_GOAL := list
SHELL         := /bin/bash

PROJECT := Learning Postgresql

COLOR_YELLOW = \033[33m
COLOR_RESET = \033[0m
COLOR_GREEN = \033[32m


.PHONY: postgres # : start postgresql service on docker
postgres:
	$(SHELL) setup.sh; docker-compose -f docker-compose.yml up -d

.PHONY: pgadmin # : start pgadmin service on docker
pgadmin: postgres
	docker-compose -f pgadmin.yml up -d

.PHONY: start # : start postgres and pgadmin on docker
start: postgres pgadmin
	docker exec -it postgres bash

.PHONY: stop # : stop postgres and pgadmin and remove containers
stop:
	docker stop postgres; docker rm postgres;
	docker stop pgadmin; docker rm pgadmin;

.PHONY: clean # : stop postgres and pgadmin and remove containers and images
clean: stop 
	 docker rmi postgres:alpine; docker rmi dpage/pgadmin4:latest;

.PHONY: list # : Makefile command list
list:
	printf "\n${COLOR_GREEN}${PROJECT}\n----------------------------------------------------\n${COLOR_RESET}"
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1 \2/' | expand -t20