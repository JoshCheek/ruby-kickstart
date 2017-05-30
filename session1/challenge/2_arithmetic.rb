# fill out the method below, then run the tests with
#   $ rake 1:2


# Given two numbers, a and b, return half of whichever is smallest, as a float
#
# arithmetic2(1, 2)    # => 0.5
# arithmetic2(19, 10)  # => 5.0
# arithmetic2(-6, -7)  # => -3.5

def arithmetic2(a, b)
  if a < b
    a /2.0
  else
    b/2.0
  end
end

puts arithmetic2(1,2).to_f
puts arithmetic2(19,10).to_f
puts arithmetic2(-6, -7).to_f
