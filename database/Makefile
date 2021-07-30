.PHONY: all test clean build dev tdd run
#.DEFAULT_GOAL := run
SHELL         := /bin/bash

db-setup:
	@scripts/db-setup.sh
	@scripts/db-init.sh
	@scripts/db-start.sh

db-init:
	# make target_db=test db-init
	@scripts/db-init.sh $(target_db)

db-start:
	@scripts/db-start.sh $(target_db)

db-stop:
	@scripts/db-stop.sh $(target_db)

install-dev:
	@scripts/install-dev.sh
