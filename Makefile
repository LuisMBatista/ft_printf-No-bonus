# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lumiguel <lumiguel@student.42lisboa.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/13 15:40:08 by lumiguel          #+#    #+#              #
#    Updated: 2024/11/05 13:32:52 by lumiguel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
CC = cc

CFLAGS = -g -Wall -Wextra -Werror

SRC_DIR = src
OBJ_DIR = obj
SRC = $(SRC_DIR)/ft_printf.c $(SRC_DIR)/ft_printf16.c $(SRC_DIR)/ft_printnbr.c $(SRC_DIR)/ft_putchar.c \
	$(SRC_DIR)/ft_putnbr_u.c $(SRC_DIR)/ft_putstr.c $(SRC_DIR)/ft_strchr.c
OBJ := $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# Rules
all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)  # Create the static library

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all
