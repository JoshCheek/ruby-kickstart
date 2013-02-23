def method_with_one_parameter(n)
end


# Code that might raise an error goes in begin/rescue/end blocks.
begin
  method_with_one_parameter(1,2,3)
  # This code won't be executed because it happened after the exception.
  1 + 2             # =>
rescue ArgumentError => e
  # We've rescued the Error, and are storing it in
  # the variable e. Errors are objects just like anything else.
  e                 # => #<ArgumentError: wrong number of arguments (3 for 1)>
  e.class           # => ArgumentError
  e.class.ancestors # => [ArgumentError, StandardError, Exception, Object, Kernel, BasicObject]
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

