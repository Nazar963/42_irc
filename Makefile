###### VARIABLE ######

NAME = ircserv

SRC = server.cpp Server_init.cpp Server_life.cpp Client.cpp Channel.cpp \
	cmd_join.cpp cmd_privmsg.cpp cmd_kick.cpp debugger.cpp cmd_topic.cpp cmd_quit.cpp \
	cmd_invite.cpp cmd_part.cpp cmd_nick.cpp cmd_mode.cpp broadCast.cpp DCC.cpp cmd_poke.cpp

OBJ_DIR = obj
OBJ = $(SRC:%.cpp=$(OBJ_DIR)/%.o)

CC = c++
CFLAGS = -Wall -Wextra -Werror -std=c++98 -g

####### RULES ########

all: $(NAME)

$(NAME): $(OBJ)
	@echo "$(MAGENTA)Linking: $(WHITE)$(CC) $(CFLAGS) -o $(NAME)$(DEF_COLOR)"
	@$(CC) $(CFLAGS) -o $(NAME) $(OBJ)
	@echo "$(GREEN)✅ Build successful: $(WHITE)$(NAME)$(DEF_COLOR)"

$(OBJ_DIR)/%.o: %.cpp | $(OBJ_DIR)
	@echo "$(GREEN)Compiling: $(BLUE)$< $(DEF_COLOR)"
	@$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)
	@echo "$(MAGENTA)Program name: $(WHITE)$(NAME)$(DEF_COLOR)"

clean:
	@rm -rf $(DIROBJ)
	@echo "$(RED)Objects removed: $(WHITE)$(OBJ)$(DEF_COLOR)"

fclean: clean
	@rm -f $(NAME) 
	@echo "$(RED)Program removed: $(WHITE)$(NAME)$(DEF_COLOR)"

re: fclean all

.PHONY: all clean fclean re

###### COLORS ########

DEF_COLOR = \033[0;39m
GRAY = \033[0;90m
RED = \033[0;91m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m
