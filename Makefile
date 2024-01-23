NAME = inception

LOGIN = woosekim

VOLUME_PATH = /home/$(LOGIN)/data
VOLUME_PATH_WP = $(VOLUME_PATH)/wordpress
VOLUME_PATH_DB = $(VOLUME_PATH)/mariadb

all: $(NAME)

$(NAME):
	mkdir -p $(VOLUME_PATH_DB)
	mkdir -p $(VOLUME_PATH_WP)
	docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	docker compose -f ./srcs/docker-compose.yml down --rmi "all" --volumes

fclean: clean
	rm -rf $(VOLUME_PATH_WP)/*
	rm -rf $(VOLUME_PATH_DB)/*
	rm -rf $(VOLUME_PATH)

.PHONY : all clean fclean re

re: fclean all