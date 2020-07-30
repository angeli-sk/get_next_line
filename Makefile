# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: akramp <marvin@codam.nl>                     +#+                      #
#                                                    +#+                       #
#    Created: 2019/11/26 14:07:00 by akramp         #+#    #+#                 #
#    Updated: 2020/01/10 21:11:11 by akramp        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = get_next_line

FLAGS = -Wall -Werror -Wextra -g # NOTE: Remove -g flag, only for debugging!

CC = gcc

SRC = ./get_next_line.c ./get_next_line_utils.c ./main_good.c  #rm test pls

SRC_B = ./get_next_line_bonus.c ./get_next_line_utils_bonus.c ./main_good.c

#OBJ_B :=	${SRC_B:%.c=%.o}

PINK = 	\033[38;5;206m
PINK2 = \033[38;5;225m
WHITE = \033[38;5;96m
X		= \033[38;5;
Y		= 1
Z		= m
TZE		= $(eval Y=$(shell echo $$((($(Y)%15)+1))))
LI		= 0
BLUE = \033[38;5;33m
RED = \033[38;5;160m
GREEN = \033[38;5;112m
RANDOM := $$((RANDOM % 10))

all: $(NAME) 

$(NAME): $(SRC)
	@echo "$(PINK2)____ ____ ___     _  _ ____ _  _ ___     _    _ _  _ ____ ";
	@echo "| __ |___  |      |\ | |___  \/   |      |    | |\ | |___ ";
	@echo "|__] |___  |  ___ | \| |___ _/\_  |  ___ |___ | | \| |___ ";
	@echo "$(WHITE)----------------------------------------------------------"
	@echo "\n$(PINK)✿ *:･ﾟ✧		Compiling $@		   ✧ﾟ･:* ✿\n$(WHITE)"
	@$(CC) $(FLAGS) -D BUFFER_SIZE=2147483646 -g -o $@ -I get_next_line.h $(SRC) 
	@echo "$(WHITE)----------------------------------------------------------"
	@echo "$(PINK2)✨💕🌸	  	   Compilation Done!    	       🌸💕✨$(WHITE)"

bonus: $(SRC_B)
	@echo "$(PINK2)____ ____ ___     _  _ ____ _  _ ___     _    _ _  _ ____ ";
	@echo "| __ |___  |      |\ | |___  \/   |      |    | |\ | |___ ";
	@echo "|__] |___  |  ___ | \| |___ _/\_  |  ___ |___ | | \| |___ ";
	@echo "$(WHITE)----------------------------------------------------------"
	@echo "\n$(PINK)✿ *:･ﾟ✧		     Compiling $@		   ✧ﾟ･:* ✿\n$(WHITE)"
	@$(CC) $(FLAGS) -D BUFFER_SIZE=100 -g -o $@ -I get_next_line_bonus.h $(SRC_B) 
	@echo "$(WHITE)----------------------------------------------------------"
	@echo "$(PINK2)✨💕🌸	  	   Compilation Done!    	       🌸💕✨$(WHITE)"

leaky:
	@$(CC) $(FLAGS) -D BUFFER_SIZE=1 -g -o $@ -I get_next_line.h $(SRC) -fsanitize=address
	
clean:
	@echo "$(PINK)🦄	Cleaning ...$(WHITE)\n"
	rm -f ./a.out
	rm -f ./*~ ./*#
	@echo "\n$(PINK2)✨	Cleaning Done!$(WHITE)"
	
fclean: clean
	@echo "$(PINK)🦄	Removing $(NAME) ...\n$(WHITE)"
	-rm -f $(NAME) leaky bonus
	@echo "\n$(PINK2)✨	Removed $(NAME)!$(WHITE)"

re: fclean all

party:
	@clear
	@echo "$(GREEN)	ﾟ✧\n			$(BLUE)			ﾟ✧";
	@echo "$(RED)				ﾟ✧\n	$(BLUE)	ﾟ✧$(GREEN)					ﾟ✧";
	@echo "$(GREEN)			ﾟ✧\n			$(BLUE)			ﾟ✧";
	@echo "$(GREEN)ﾟ✧$(RED)				ﾟ✧\n	$(BLUE)	 ﾟ✧";
	@echo "$(BLUE)~..	$(RED)ﾟ✧$(BLUE)	ヽ(ﾟｰﾟ*ヽ)$(RED)ヽ(*ﾟｰﾟ*)ﾉ$(GREEN)(ﾉ*ﾟｰﾟ)ﾉ	$(RED)✧ﾟ$(GREEN)	..~";
	@sleep 0.3
	@clear
	@echo "$(RED)	ﾟ✧\n			$(GREEN)		ﾟ✧";
	@echo "$(BLUE)				ﾟ✧\n	$(GREEN)	ﾟ✧$(RED)					ﾟ✧";
	@echo "$(BLUE)			ﾟ✧\n		$(RED)		ﾟ✧";
	@echo "$(BLUE)ﾟ✧$(GREEN)					ﾟ✧\n	$(RED)	 ﾟ✧";
	@echo "$(GREEN)~..	$(BLUE)ﾟ✧$(BLUE)	ヽ(ﾟｰﾟ*ヽ)$(RED)ヽ(*ﾟｰﾟ*)ﾉ$(GREEN)(ﾉ*ﾟｰﾟ)ﾉ	$(RED)✧ﾟ$(GREEN)	..~";
	@sleep 0.3
	@clear
	@echo "$(GREEN)	ﾟ✧\n			$(BLUE)			ﾟ✧";
	@echo "$(RED)				ﾟ✧\n	$(BLUE)	ﾟ✧$(GREEN)					ﾟ✧";
	@echo "$(GREEN)			ﾟ✧\n			$(BLUE)			ﾟ✧";
	@echo "$(GREEN)ﾟ✧$(RED)				ﾟ✧\n	$(BLUE)	 ﾟ✧";
	@echo "$(BLUE)~..	$(RED)ﾟ✧$(BLUE)	ヽ(ﾟｰﾟ*ヽ)$(RED)ヽ(*ﾟｰﾟ*)ﾉ$(GREEN)(ﾉ*ﾟｰﾟ)ﾉ	$(RED)✧ﾟ$(GREEN)	..~";
	@sleep 0.3
	@clear
	@echo "$(RED)	ﾟ✧\n			$(GREEN)		ﾟ✧";
	@echo "$(BLUE)				ﾟ✧\n	$(GREEN)	ﾟ✧$(RED)					ﾟ✧";
	@echo "$(BLUE)			ﾟ✧\n		$(RED)		ﾟ✧";
	@echo "$(BLUE)ﾟ✧$(GREEN)					ﾟ✧\n	$(RED)	 ﾟ✧";
	@echo "$(GREEN)~..	$(BLUE)ﾟ✧$(BLUE)	ヽ(ﾟｰﾟ*ヽ)$(RED)ヽ(*ﾟｰﾟ*)ﾉ$(GREEN)(ﾉ*ﾟｰﾟ)ﾉ	$(RED)✧ﾟ$(GREEN)	..~";
	@sleep 0.3
	@clear
	@echo "$(GREEN)	ﾟ✧\n			$(BLUE)			ﾟ✧";
	@echo "$(RED)				ﾟ✧\n	$(BLUE)	ﾟ✧$(GREEN)					ﾟ✧";
	@echo "$(GREEN)			ﾟ✧\n			$(BLUE)			ﾟ✧";
	@echo "$(GREEN)ﾟ✧$(RED)				ﾟ✧\n	$(BLUE)	 ﾟ✧";
	@echo "$(BLUE)~..	$(RED)ﾟ✧$(BLUE)	ヽ(ﾟｰﾟ*ヽ)$(RED)ヽ(*ﾟｰﾟ*)ﾉ$(GREEN)(ﾉ*ﾟｰﾟ)ﾉ	$(RED)✧ﾟ$(GREEN)	..~";
	@sleep 0.3
	@clear
	@echo "$(RED)	ﾟ✧\n			$(GREEN)		ﾟ✧";
	@echo "$(BLUE)				ﾟ✧\n	$(GREEN)	ﾟ✧$(RED)					ﾟ✧";
	@echo "$(BLUE)			ﾟ✧\n		$(RED)		ﾟ✧";
	@echo "$(BLUE)ﾟ✧$(GREEN)					ﾟ✧\n	$(RED)	 ﾟ✧";
	@echo "$(GREEN)~..	$(BLUE)ﾟ✧$(BLUE)	ヽ(ﾟｰﾟ*ヽ)$(RED)ヽ(*ﾟｰﾟ*)ﾉ$(GREEN)(ﾉ*ﾟｰﾟ)ﾉ	$(RED)✧ﾟ$(GREEN)	..~";
	@sleep 0.3
	@clear
	@echo "$(GREEN)	ﾟ✧\n			$(BLUE)			ﾟ✧";
	@echo "$(RED)				ﾟ✧\n	$(BLUE)	ﾟ✧$(GREEN)					ﾟ✧";
	@echo "$(GREEN)			ﾟ✧\n			$(BLUE)			ﾟ✧";
	@echo "$(GREEN)ﾟ✧$(RED)				ﾟ✧\n	$(BLUE)	 ﾟ✧";
	@echo "$(BLUE)~..	$(RED)ﾟ✧$(BLUE)	ヽ(ﾟｰﾟ*ヽ)$(RED)ヽ(*ﾟｰﾟ*)ﾉ$(GREEN)(ﾉ*ﾟｰﾟ)ﾉ	$(RED)✧ﾟ$(GREEN)	..~";
	@sleep 0.3
	@clear
	@echo "$(RED)	ﾟ✧\n			$(GREEN)		ﾟ✧";
	@echo "$(BLUE)				ﾟ✧\n	$(GREEN)	ﾟ✧$(RED)					ﾟ✧";
	@echo "$(BLUE)			ﾟ✧\n		$(RED)		ﾟ✧";
	@echo "$(BLUE)ﾟ✧$(GREEN)					ﾟ✧\n	$(RED)	 ﾟ✧";
	@echo "$(GREEN)~..	$(BLUE)ﾟ✧$(BLUE)	ヽ(ﾟｰﾟ*ヽ)$(RED)ヽ(*ﾟｰﾟ*)ﾉ$(GREEN)(ﾉ*ﾟｰﾟ)ﾉ	$(RED)✧ﾟ$(GREEN)	..~";
	@sleep 0.3
	@clear