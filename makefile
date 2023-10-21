all: start

start:
	@mkdir -p /home/aelyakou/data
	@mkdir -p /home/aelyakou/data/wp_vol
	@mkdir -p /home/aelyakou/data/mdb_vol
	@cd ./srcs && docker-compose up -d

stop:
	cd ./srcs && docker-compose down
clean: stop
	docker rmi -f srcs_mariadb srcs_wordpress srcs_nginx srcs_website
fclean: clean
	@rm -rf /home/aelyakou/data
	docker volume rm -f wp_vol mdb_vol
	docker system prune -af

re: clean all