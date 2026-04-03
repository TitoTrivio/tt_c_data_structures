CC=gcc

SRCDIRS=./src
INCDIRS=$(SRCDIRS) ./include
BUILDDIR=./build

BINARY=$(BUILDDIR)/libtt_c_data_structures.dll

DEPFLAGS=-MD -MD
CCFLAGS=-Wall -Wextra -g $(DEPFLAGS) $(foreach D,$(INCDIRS),-I$(D))

SRCFILES=$(foreach D,$(SRCDIRS),$(wildcard $(D)/*.c))
OBJFILES=$(patsubst %.c,%.o,$(SRCFILES))
DEPFILES=$(patsubst %.c,%.d,$(SRCFILES))

all:$(BINARY)

$(BINARY):$(OBJFILES)
	$(CC) -shared -o $@ $^

%.o:%.c
	$(CC) $(CCFLAGS) -c -o $@ $^

clean:
	rm -rf $(BINARY) $(OBJFILES) $(DEPFILES)

