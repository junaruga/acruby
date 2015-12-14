CC = gcc
TOP = ..
TARGET = $(TOP)/bin/acruby
CDEFS =
CFLAGS = -g -Wall $(CDEFS)
LIBS = -lpthread -lgc

SRCS=$(wildcard *.c)
OBJS:=$(SRCS:.c=.o)
DEPS:=$(OBJS:.o=.d)

all : $(TARGET)
.PHONY : all

%.o: %.c
	$(CC) $(CFLAGS) -MMD -MP -c -o $@ $<

$(TARGET) : $(OBJS)
	mkdir -p "$$(dirname $(TARGET))"
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET) $(LIBS)

format:
	find . -name "*.c" | xargs gindent -kr -nut

clean :
	rm -f *.d *.o $(TARGET)
.PHONY : clean

-include $(DEPS)
