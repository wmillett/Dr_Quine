
# Flags and files
CC = clang
CFLAGS = -Wall -Wextra -Werror
P1 = Colleen
P2 = Grace
P3 = Sully
PROGS = Colleen Grace Sully
SRC_P1 = Colleen.c
SRC_P2 = Grace.c
SRC_P3 = Sully.c
TST_C = tmp_$(P1)
TST_G = Grace_kid.c
TST_S = tmp_$(P3)

# Colors
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
BOLD = \033[1m
ORANGE = \033[0;91m
MAGENTA = \033[0;35m
CYAN = \033[0;36m
RESET = \033[0m

# Object file
OBJ_P1 = $(SRC_P1:.c=.o)
OBJ_P2 = $(SRC_P2:.c=.o)
OBJ_P3 = $(SRC_P3:.c=.o)

# Default rule
all: $(P1) $(P2) $(P3)

# Compile the executable
$(P1): $(OBJ_P1)
	@$(CC) $(CFLAGS) -o $(P1) $(OBJ_P1)

$(P2): $(OBJ_P2)
	@$(CC) $(CFLAGS) -o $(P2) $(OBJ_P2)

$(P3): $(OBJ_P3)
	@$(CC) $(CFLAGS) -o $(P3) $(OBJ_P3)

# Compile source to object file
%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

# Clean test files
tclean:
	@rm -f $(TST_C)
	@rm -f $(TST_G)
	@rm -f $(TST_S)


# Clean object and test files
clean:	tclean
	@rm -f $(OBJ_P1)
	@rm -f $(OBJ_P2)
	@rm -f $(OBJ_P3)


# Full clean (remove executable and object files)
fclean: clean
	@rm -f $(PROGS)

# Rebuild the project
re: fclean all

# Test the project
test: all
	
	@echo "$(MAGENTA)Test for Colleen$(RESET)"
	@./Colleen > $(TST_C)                         
	@-diff $(TST_C) Colleen.c
	@echo "If 0 then the test passes: $$?"

	@echo "$(CYAN)Test for Grace$(RESET)"
	@./Grace                    
	@-diff $(TST_G) Grace.c
	@echo "If 0 then the test passes: $$?"
	@echo "$(YELLOW)Test for Sully$(RESET)"
	@./Sully > $(TST_S)                         
	@-diff $(TST_S) Sully.c
	@echo "If 0 then the test passes: $$?"

# Phony targets
.PHONY: all clean fclean re test