# build:
# 	docker-compose -f ./srcs/docker-compose.yml --build
	
all: up

up:
	docker-compose up --build

down:
	docker-compose --volume down

help:
	@echo ""
	@echo "\033[32mYOUR BEST MAKE HELPER\033[0m\n"
	@echo "\033[36mOPTION\033[0m            \033[36mCOMMAND\033[0m"
	@echo "make build   ->   docker-compose build"
	@echo "make up      ->   docker-compose up"
	@echo "make down    ->   docker-compose --volume down"
	@echo ""

.PHONY: up down help
