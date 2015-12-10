.PHONY: dummy check

dummy:
	@echo "Not implemented."

check:
	ruby ./sample/rbdump.rb ./sample/test/times.rb
