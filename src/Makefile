CC = gcc
TOP = ..
TARGET = $(TOP)/bin/acruby
# -g: Generate source level debug information
# -Wall: This enables all the warnings
CFLAGS = -g -Wall
# LIBS = -lfoo -lbar
LIBS =

SRCS=$(wildcard *.c)
OBJS:=$(SRCS:.c=.o)
DEPS:=$(OBJS:.o=.d)

.PHONY : all
all : $(TARGET)

# -MMD: dependency info is written to .d files.
#       Targets are only user head files.
# -MP:  Create phony target for each dependency
%.o : %.c
	$(CC) $(CFLAGS) -MMD -MP -c -o $@ $<

$(TARGET) : $(OBJS)
	mkdir -p "$$(dirname $(TARGET))"
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET) $(LIBS)

.PHONY : format
format:
	find . -name "*.c" -o -name "*.h" | xargs gindent -kr -nut

.PHONY : clean
clean :
	rm -f *.d *.o $(TARGET)

-include $(DEPS)
