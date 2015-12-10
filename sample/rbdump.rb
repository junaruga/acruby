#!/usr/bin/env ruby

# Usage: rbdump.rb [Ruby file]
# This is to display parse process of ruby file.

require 'ripper'
require 'pp'

RUBY_DUMP_TREE_FORMAT = "ruby --dump parsetree %s"
HEADER_SIZE = 70

def print_str(title, &block)
  if title.nil?
    raise ArgumentError.new("title is required.")
  end
  header_line = "=" * HEADER_SIZE
  puts header_line
  puts title.center(HEADER_SIZE)
  puts header_line
  block.call
  puts ""
end

if ARGV.size < 1 then
  puts("error: invalid arguments count")
  exit(1)
end
ruby_file = ARGV[0]

# Bulk Read
code = '' 
open(ruby_file) do |f|
  code = f.read
end

print_str('Ruby') do
   puts "%s\n" % code
end
print_str('Toeken Array') do
   pp Ripper.lex(code)
end
print_str('Abstract Structure Tree (AST) Node - Ripper') do
   pp Ripper.sexp(code)
end
print_str('Abstract Structure Tree (AST) Node - C Base') do
  system(RUBY_DUMP_TREE_FORMAT % ruby_file)
end
