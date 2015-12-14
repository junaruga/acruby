.PHONY: all clean check

all clean:
	$(MAKE) -C src $@

check:
	ruby ./sample/rbdump.rb ./sample/test/times.rb
