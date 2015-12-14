.PHONY: all clean check

all clean:
	$(MAKE) -C src $@

format:
	find src -name *.c | xargs gindent -kr -nut

check:
	ruby ./sample/rbdump.rb ./sample/test/times.rb
