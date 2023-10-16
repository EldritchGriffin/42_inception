all: start

start:
	@mkdir -p /Users/aelyakou/Desktop/data
	@mkdir -p /Users/aelyakou/Desktop/data/wp_vol
	@mkdir -p /Users/aelyakou/Desktop/data/mdb_vol
	@cd ./srcs && docker-compose up -d
	
clean:
	@rm -rf /Users/aelyakou/Desktop/data
	cd ./srcs && docker-compose down
	docker volume rm -f wp_vol mdb_vol
	docker rmi -f srcs-mariadb srcs-wordpress srcs-nginx
fclean: clean
	docker system prune -af

re: clean all