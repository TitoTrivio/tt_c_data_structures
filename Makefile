ifneq ($(OS), Windows_NT)
	OS:=$(shell uname -s)
endif

ifeq ($(OS), Windows_NT)
    LIB_EXT=.dll
else
    LIB_EXT=.so
endif

CC=gcc

SRC_DIRS=./src
INC_DIRS=$(SRC_DIRS) ./include
BUILD_DIR=./build

BINARY=$(BUILD_DIR)/libtt_c_data_structures$(LIB_EXT)

DEP_FLAGS=-MD -MD
CC_FLAGS=-Wall -Wextra -g $(DEP_FLAGS) $(foreach D,$(INC_DIRS),-I$(D))

SRC_FILES=$(foreach D,$(SRC_DIRS),$(wildcard $(D)/*.c))
OBJ_FILES=$(patsubst %.c,%.o,$(SRC_FILES))
DEP_FILES=$(patsubst %.c,%.d,$(SRC_FILES))

all:$(BINARY)

$(BINARY):$(OBJ_FILES)
	@[ -d $(BUILD_DIR) ] || mkdir -p $(BUILD_DIR)
	$(CC) -shared -o $@ $^

%.o:%.c
	$(CC) $(CC_FLAGS) -c -o $@ $^

clean:
	rm -rf $(BINARY) $(OBJ_FILES) $(DEP_FILES)

