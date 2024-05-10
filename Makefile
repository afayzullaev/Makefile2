.PHONY: all clean

CC := gcc
CFLAGS := 

BUILD_DIR := build
$(shell mkdir -p $(BUILD_DIR))

SRC := main.c 
OBJ := $(BUILD_DIR)/main.o
HEADER := main.h

all: $(BUILD_DIR)/executable
	@echo "Finished!"

$(BUILD_DIR)/%.o : %.c $(HEADER)
	$(CC) $(CFLAGS) -I./ -c $< -o $@

$(BUILD_DIR)/executable: $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -rf build/