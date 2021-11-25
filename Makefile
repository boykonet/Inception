all: up

up:
	mkdir -p ./srcs/requirements/tools/mariadb_database
	mkdir -p ./srcs/requirements/tools/wordpress_database
	docker-compose -f ./srcs/docker-compose.yml \
		--project-directory ./srcs \
		up --build -d

down:
	docker-compose -f ./srcs/docker-compose.yml \
		--project-directory ./srcs down

destroy:
	rm -rf ./srcs/requirements/tools/mariadb_database
	rm -rf ./srcs/requirements/tools/wordpress_database

help:
	@echo ""
	@echo "\033[32mINSEPTION\033[0m\n"
	@echo "\033[36mOPTION\033[0m                 \033[36mCOMMAND\033[0m"
	@echo "up                     create networks: netinet;"
	@echo "                       create volumes: mariadb and wordpress;"
	@echo "                       create images: mariadb, nginx and wordpress;"
	@echo "                       create containers: mariadb, nginx and wordpress"
	@echo "                       -----------------------------------------------"
	@echo "down                   remove all networks, containers, volumes"
	@echo "                       -----------------------------------------------"
	@echo "destroy                destroy mariadb_database and wordpress_database"
	@echo "                       -----------------------------------------------"
	@echo ""

.PHONY: up down help
