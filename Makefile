TARGET = bin/acruby

CTAGS = /usr/local/bin/ctags
RM = rm -f

TESTS = $(wildcard sample/test/*.rb)

.PHONY: all format clean
all format clean:
	$(MAKE) -C src $@

.PHONY: test
test : all
	$(TARGET) $(TESTS)
# 	$(TARGET) -c $(TESTS)

.PHONY: ctags
ctags:
	$(RM) ./tags; \
	$(CTAGS) -R .; \
	$(CTAGS) -a -R /usr/include

.PHONY: global
global:
	gtags --gtagslabel=pygments

.PHONY: stool
stool: ctags global

.PHONY: check
check:
	ruby ./sample/rbdump.rb ./sample/test/times.rb
