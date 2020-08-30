.SILENT:
.DEFAULT_GOAL := list
SHELL         := /bin/bash

PROJECT := Learning Postgresql

.PHONY: postgres # : install all requirements needed
postgres:
	$(SHELL) setup.sh &
	docker-compose -f docker-compose.yml up -d


.PHONY: pgadmin # : install all requirements needed
pgadmin:
	docker-compose -f pgadmin.yml up -d


.PHONY: start
start: postgres pgadmin
	docker exec -it postgres bash

.PHONY: stop
stop:
	docker stop postgres; docker rm postgres;
	docker stop pgadmin; docker rm pgadmin;

.PHONY: clean
clean: stop
	docker rmi postgres; docker rmi pgadmin;