# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amaquena <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/08/19 12:39:12 by amaquena          #+#    #+#              #
#    Updated: 2019/08/30 14:44:39 by amaquena         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = push_swap.a
CHCK = checker
PUSH = push_swap
CFILES = swap.c list.c rotate.c reverse.c sorter.c
PS_CFILES = algo.c
OFILES = $(CFILES:.c=.o)
CC = gcc
FLAGS = -Wall -Wextra -Werror
LIBFT = -L./libft -lft

lft:
	$(MAKE) -C libft all
lftclean:
	$(MAKE) -C libft clean
lftfclean:
	$(MAKE) -C libft fclean
lftre:
	$(MAKE) -C libft re

$(NAME):
	@$(CC) -c $(FLAGS) $(CFILES)
	@ar rcs $(NAME) $(OFILES)
	@ranlib $(NAME)

all: $(NAME) $(CHCK) $(PUSH)
clean:
	@rm -f $(OFILES)

fclean: clean
	@rm -f $(NAME)
	@rm -f $(CHCK)
	@rm -f $(PUSH)
re: fclean all
	@echo "\t\t---COMPLETED---\n"
$(CHCK): fclean
	$(CC) $(FLAGS) $(CHCK).c $(CFILES) $(LIBFT) -o $(CHCK)
	@echo "______________________________________________________________________\n"
$(PUSH): fclean
	$(CC) $(FLAGS) $(PUSH).c $(CFILES) $(PS_CFILES) $(LIBFT) -o $(PUSH)
	@echo "______________________________________________________________________\n"
dgcc: re
	$(CC) -g $(FLAGS) checker.c $(CFILES) $(LIBFT) -o checker
	@echo "______________________________________________________________________\n"
