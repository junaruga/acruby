TARGET = bin/acruby

TESTS = $(wildcard sample/test/*.rb)

.PHONY: all clean check

all format clean:
	$(MAKE) -C src $@

test : all
	$(TARGET) $(TESTS)
# 	$(TARGET) -c $(TESTS)

check:
	ruby ./sample/rbdump.rb ./sample/test/times.rb
