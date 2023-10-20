all: start

start:
	@mkdir -p /Users/aelyakou/Desktop/data
	@mkdir -p /Users/aelyakou/Desktop/data/wp_vol
	@mkdir -p /Users/aelyakou/Desktop/data/mdb_vol
	@cd ./srcs && docker-compose up -d

stop:
	cd ./srcs && docker-compose down
clean: stop
	docker rmi -f srcs-mariadb srcs-wordpress srcs-nginx srcs-website
fclean: clean
	@rm -rf /Users/aelyakou/Desktop/data
	docker volume rm -f wp_vol mdb_vol
	docker system prune -af

re: clean all