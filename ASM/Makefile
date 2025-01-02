# Flags, files, and directories
AS = nasm                # Assembler
ASFLAGS_LINUX = -f elf64       # NASM output format for 64-bit Linux
ASFLAGS_MAC = -f macho64      # NASM output format for 64-bit macOS
LD_LINUX = ld            # Linux linker
LD_MAC = clang           # macOS linker (use clang for simplicity)
LDFLAGS_LINUX = -e _start -lc -dynamic-linker /lib64/ld-linux-x86-64.so.2
LDFLAGS_MAC = -e _main -lc -Wl,-no_pie  # macOS linker flags
P1 = Colleen
P2 = Grace
P3 = Sully
PROGS = $(P1) $(P2) $(P3)
SRC_P1 = Colleen.s
SRC_P2 = Grace.s
SRC_P3 = Sully.s
TST_C = tmp_$(P1)
TST_G = Grace_kid.s
TST_S = Sully_4.s Sully_3.s Sully_2.s Sully_1.s Sully_0.s
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

# Detect OS
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    ASFLAGS = $(ASFLAGS_LINUX)
    LD = $(LD_LINUX)
    LDFLAGS = $(LDFLAGS_LINUX)
else ifeq ($(UNAME_S),Darwin)
    ASFLAGS = $(ASFLAGS_MAC)
    LD = $(LD_MAC)
    LDFLAGS = $(LDFLAGS_MAC)
else
    $(error Unsupported OS: $(UNAME_S))
endif

# Object files
OBJ_P1 = $(OBJ_DIR)/$(SRC_P1:.s=.o)
OBJ_P2 = $(OBJ_DIR)/$(SRC_P2:.s=.o)
OBJ_P3 = $(OBJ_DIR)/$(SRC_P3:.s=.o)

# Default rule
all: $(P1) $(P2) $(P3)

# Compile the executables
$(P1): $(OBJ_P1)
	@$(LD) $(LDFLAGS) -o $(P1) $(OBJ_P1)

$(P2): $(OBJ_P2)
	@$(LD) $(LDFLAGS) -o $(P2) $(OBJ_P2)

$(P3): $(OBJ_P3)
	@$(LD) $(LDFLAGS) -o $(P3) $(OBJ_P3)

# Compile source to object file
$(OBJ_DIR)/%.o: %.s | $(OBJ_DIR)
	@$(AS) $(ASFLAGS) $< -o $@

# Clean files from Sully
clean_sully:
	@rm -f Sully_[0-9]*.s Sully_[0-9]*

# Clean test files
tclean: clean_sully
	@rm -f $(TST_C)
	@rm -f $(TST_G)

# Clean object and test files
clean:	tclean
	@rm -rf $(OBJ_DIR)

# Full clean (remove executables and object files)
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
	@-diff $(TST_C) Colleen.s
	@echo "If no make errors ignored then it passes"

test_grace: $(P2)
	@echo "$(CYAN)Test for Grace$(RESET)"
	@-./Grace                    
	@-diff $(TST_G) Grace.s
	@echo "If no make errors ignored then it passes"

test_sully: $(P3)
	@echo "$(YELLOW)Test for Sully$(RESET)"
	@./Sully
	@echo "$(GREEN)Here are all the Sully executables and their sources$(RESET)"
	@ls -al | grep Sully	
	@echo "$(YELLOW)Tests should now indicate the only difference between the source codes is the int i$(RESET)"
	@-diff Sully.s Sully_0.s

# Test all the programs in the project
test_all: test_colleen test_grace test_sully

# Phony targets
.PHONY: all clean fclean tclean clean_sully re test_all test_colleen test_grace test_sully
