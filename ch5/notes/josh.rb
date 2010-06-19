# =====  Exceptions  =====
# errors and exceptions are used to say "something fucked up"
# it halts evaluation, and returns to where it was called from
# incrementally making its way up the stack (the series of methods that were called to get to 
# wherever the exception was raised) until it is either rescued, or crashes the program

# There are quite a few exceptions in Ruby (one of your challenges will be to find them :)
# You've seen them before, but perhaps didn't know what they were
def method_with_one_parameter(n) end
begin
  method_with_one_parameter(1,2,3)
rescue => e
  e                 # => #<ArgumentError: wrong number of arguments (3 for 1)>
  e.class           # => ArgumentError
  e.class.ancestors # => [ArgumentError, StandardError, Exception, Object, Kernel]
end

# You can rescue specific exceptions if you like
begin
  method_with_one_parameter(1,2,3)
rescue ZeroDivisionError => e
  e # => 
rescue ArgumentError => e
  e # => #<ArgumentError: wrong number of arguments (3 for 1)>
end

begin
  1 / 0
rescue ZeroDivisionError => e
  e # => #<ZeroDivisionError: divided by 0>
rescue ArgumentError => e
  e # => 
end

# If you handle the exception, you may want to try again
numerator = 100
denominator = 0
begin
  result = numerator / denominator
rescue ZeroDivisionError => e
  denominator += 1
  retry
end
result        # => 100
denominator   # => 1

# You can raise your own exceptions
def show_exception
  begin
    yield
  rescue Exception => e
    e
  end
end

def get_names(full_name)
  raise ArgumentError.new("you need to submit the name as 'Firstname Lastname'") unless full_name[ /^[A-Z][a-z]* [A-Z][a-z]*$/ ]
  full_name.split
end

show_exception { get_names 'josh cheek' } # => #<ArgumentError: you need to submit the name as 'Firstname Lastname'>
show_exception { get_names 'Josh Cheek' } # => ["Josh", "Cheek"]

# QUESTION: Why did our program return an ArgumentError? We caught an Exception



# =====  Regular Expressions  =====
# Regular expressions are one of those things that look really scary, and take some time to get used to
# But they are not that difficult to use, and they are _very_ useful. 
# These are probably the things that are most useful to a non programmer
# Their job is to help you process Strings. They are patterns that strings can fit into.
# And they are mostly pretty easy :) You just have to learn a few rules, and have a cheatsheet until you get to know them
# 
# First, go check out rubular.com where you can put in a String and a regular expression, and you can see all the places it matches
# For the regular expressino enter "b.b" and for the String, "bobbling babbling bubbles" 
# Notice that it has highlighted "bob", "bab", and "bub"
# These are the areas where your regular expression matches the String.



# =====  Require  =====
# when you are in one Ruby file, and you want to load another one in, you use the key word require
require '../examples/1_load_me'


# now we can use methods that are defined in that file
say_hello # => "hello"

# we can also load files from the standard library this way
Module.constants.grep(/erb/i) # => []
require 'erb'
Module.constants.grep(/erb/i) # => ["ERB"]





# rubygems
# haml
# sinatra
