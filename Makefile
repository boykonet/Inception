all: up

up:
	mkdir -p /home/gkarina/data/mariadb_database
	mkdir -p /home/gkarina/data/wordpress_database
	docker-compose -f ./srcs/docker-compose.yml \
		--project-directory ./srcs \
		up --build -d

down:
	docker-compose -f ./srcs/docker-compose.yml \
		--project-directory ./srcs down --volumes

destroy: down
	rm -rf /home/gkarina/data/mariadb_database
	rm -rf /home/gkarina/data/wordpress_database

fclean: down up

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

.PHONY: up down destroy fclean help