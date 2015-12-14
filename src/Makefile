CC = gcc
TOP = ..
TARGET = $(TOP)/bin/acruby
CDEFS =
# -g: Generate source level debug information
# -Wall: This enables all the warnings
CFLAGS = -g -Wall $(CDEFS)
# LIBS = -lfoo -lbar
LIBS =

SRCS=$(wildcard *.c)
OBJS:=$(SRCS:.c=.o)
DEPS:=$(OBJS:.o=.d)

all : $(TARGET)
.PHONY : all

%.o: %.c
	$(CC) $(CFLAGS) -MMD -MP -c -o $@ $<

$(TARGET) : $(OBJS)
	mkdir -p "$$(dirname $(TARGET))"
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET)

format:
	find . -name "*.c" | xargs gindent -kr -nut

clean :
	rm -f *.d *.o $(TARGET)
.PHONY : clean

-include $(DEPS)
