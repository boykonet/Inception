build:
	docker-compose -f ./srcs/docker-compose.yml -- build
	
up:
	docker-compose up

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

.PHONY: build up down help
