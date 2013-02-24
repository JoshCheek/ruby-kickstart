# A Proc is just a way of storing code in an object
# It's just like a method in that it takes parameters, evaluates
# code, and then returns a result.
square_it_proc = Proc.new { |num| num * num }


# Its parameters are given in the pipes, so the above |num| is
# the parameter that the proc receives.


# You tell it to execute with the call method
square_it_proc.call 5  # => 25
square_it_proc.call 10 # => 100


# Compare it to a method
def square_it_method(num)
  num * num
end
square_it_method 5    # => 25
square_it_method 10   # => 100
