all: start

start:
	@cd ./srcs && docker-compose up -d
	
clean:
	@cd ./srcs && \
	docker compose down && \
	docker system prune -f