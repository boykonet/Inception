build:
	docker-compose build
	
up:
	docker-compose up

down:
	docker-compose --volume down

.PHONY: build up down
