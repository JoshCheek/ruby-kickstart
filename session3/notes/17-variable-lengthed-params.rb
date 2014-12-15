# After listing your ordinal and optional parameters, you can take
# a variable length of arguments. To do this, you use '*' before
# the parameter. In Ruby 1.8, it must be the last parameter.
# The parameters that match it will be put into an array.
def variable_length(first, second=:default, *rest)
  [first, second, rest]
end
variable_length 1           # => [1, :default, []]
variable_length 1, 2        # => [1, 2, []]
variable_length 1, 2, 3     # => [1, 2, [3]]
variable_length 1, 2, 3, 4  # => [1, 2, [3, 4]]


# how might we use it?
def minimum( *numbers )
  min = numbers.first
  numbers.each { |number| min = number if number < min }
  min
end

minimum 2, 1             # => 1
minimum 2, 1, 5, -3, 16  # => -3


# In the same way that we can use & to take a block out of
# the block slot or put it back in, we can use * to take a
# variable number of arguments out, or put them back in.
ruby_kickstart_favourite_numbers = [12, 13, 3, 43, 7]
minimum(  12, 13, 3, 43, 7 )                 # => 3
minimum(*[12, 13, 3, 43, 7])                 # => 3
minimum(*ruby_kickstart_favourite_numbers )  # => 3
