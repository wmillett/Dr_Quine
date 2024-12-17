
# Flags, files and directories
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
TST_S = Sully_4.c Sull_3.c Sully_2.c Sully_1.c Sully_0.c
OBJ_DIR = obj

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

# Compile the executables
$(P1): $(OBJ_DIR)/$(OBJ_P1)
	@$(CC) $(CFLAGS) -o $(P1) $(OBJ_DIR)/$(OBJ_P1)

$(P2): $(OBJ_DIR)/$(OBJ_P2)
	@$(CC) $(CFLAGS) -o $(P2) $(OBJ_DIR)/$(OBJ_P2)

$(P3): $(OBJ_DIR)/$(OBJ_P3)
	@$(CC) $(CFLAGS) -o $(P3) $(OBJ_DIR)/$(OBJ_P3)

# Compile source to object file
$(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

# Clean files from Sully
clean_sully:
	@rm -f Sully_[0-9]*.c Sully_[0-9]*

# Clean test files
tclean: clean_sully
	@rm -f $(TST_C)
	@rm -f $(TST_G)

# Clean object and test files
clean:	tclean
	@rm -rf $(OBJ_DIR)

# Full clean (remove executable and object files)
fclean: clean
	@rm -f $(PROGS)

# Create object directory
$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

# Rebuild the project
re: fclean all

test_colleen: $(P1)
	@echo "$(MAGENTA)Test for Colleen$(RESET)"
	@./Colleen > $(TST_C)                         
	@-diff $(TST_C) Colleen.c
	@echo "If 0 then the test passes: $$?"

test_grace: $(P2)
	@echo "$(CYAN)Test for Grace$(RESET)"
	@./Grace                    
	@-diff $(TST_G) Grace.c
	@echo "If 0 then the test passes: $$?"

test_sully: $(P3)
	@echo "$(YELLOW)Test for Sully$(RESET)"
	@./Sully
	@echo "$(GREEN)Here are all the Sully executables and their sources$(RESET)"
	@ls -al | grep Sully	
	@echo "$(YELLOW)Tests should now indicate the only difference between the source codes is the int i$(RESET)"
	@-diff Sully.c Sully_0.c

# Test all the programs in the project
test_all: test_colleen test_grace test_sully


# Phony targets
.PHONY: all clean fclean tclean clean_sully re test_all test_colleen test_grace test_sully