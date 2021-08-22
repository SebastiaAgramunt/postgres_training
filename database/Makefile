.DEFAULT_GOAL := list
SHELL         := /bin/bash

COLOR_RESET = \033[0m
COLOR_COMMAND = \033[36m
COLOR_YELLOW = \033[33m
COLOR_GREEN = \033[32m
COLOR_RED = \033[31m

AUTHOR := Sebastia Agramunt Puig
PROJECT := Postgres Bolilerplate (Author ${AUTHOR})

DB-SETUP-LOG=db-setup.log
DB-START-LOG=db-start.log
DB-STOP-LOG=db-stop.log

.PHONY: db-setup # : create a new database and upload raw_data
db-setup:
	@echo "db-setup writing logs to ${DB-SETUP-LOG}"
	@scripts/db-setup.sh > ${DB-SETUP-LOG} 2>&1
	@echo "setup finished, logs in ${PWD}/${DB-SETUP-LOG}"

.PHONY: db-start # : start postgres database
db-start:
	@scripts/db-start.sh > ${DB-START-LOG} 2>&1 &
	@echo "db-start writing logs to ${DB-START-LOG}"
	@echo "logs in ${PWD}/${DB-START-LOG}"

.PHONY: db-stop # : stop postgres database
db-stop:
	@echo "db-stop writing logs to ${DB-STOP-LOG}"
	@scripts/db-stop.sh > ${DB-STOP-LOG} 2>&1
	@echo "logs in ${PWD}/${DB-STOP-LOG}"

.PHONY: list # : Makefile command list
list:
	printf "\n${COLOR_YELLOW}${PROJECT}\n-------------------------------------------------------------------\n${COLOR_RESET}"
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1 \2/' | expand -t20