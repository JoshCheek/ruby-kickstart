# Symbols look like this:
:this_is_a_symbol       # => :this_is_a_symbol
:this_is_a_symbol.class # => Symbol


# Symbols are Strings that are immutable, meaning they can never
# change, like numbers. They are never garbage collected, so if
# you use one, it will last until your program ends.


# They are most commonly used as hash keys, because their hash
# value can be cached, making them as efficient as a number for
# this purpose. They are also used frequently in place of enum types,
# and used internally in Ruby to refer to things like method names.


# For example, it is common to declare attr_accessor with a symbol.
# And instance_methods returns back symbols representing the methods,
# because that's what Ruby uses internally.
class Example
  instance_methods(false) # => []
  attr_accessor :my_method
  instance_methods(false) # => [:my_method, :my_method=]
end
