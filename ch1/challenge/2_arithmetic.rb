# fill out the method below, then run the tests with
#   $ rake 1:2


# Given two numbers, a and b, return half of whichever is smallest, as a float
# 
# Hint: the return keyword is the same as Java and comparisons are the same as Java
# Hint: 10 * 10   # => 100
#       10 * 10.0 # => 100.0
#
# arithmetic2(1,2)    # => 0.5
# arithmetic2(19,10)  # => 5.0
# arithmetic2(-6,-7)  # => -3.5

def arithmetic2(a,b)
  if a < b
    return a / 2.0
  else
    return b / 2.0
  end
end
