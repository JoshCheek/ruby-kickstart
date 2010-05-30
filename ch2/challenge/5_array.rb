# Given an array with an odd length
# look at the first, last, and middle values in the array
# and return the largest. The array length will be a least 1. 
# 
# max_triple( [1, 2, 3]              ) # => 3      
# max_triple( [1, 5, 3]              ) # => 5      
# max_triple( [5, 2, 3]              ) # => 5      
# max_triple( [1, 2, 3, 1, 1]        ) # => 3      
# max_triple( [1, 7, 3, 1, 5]        ) # => 5      
# max_triple( [5, 1, 3, 7, 1]        ) # => 5      
# max_triple( [5, 1, 7, 3, 7, 8, 1]  ) # => 5      
# max_triple( [5, 1, 7, 9, 7, 8, 1]  ) # => 9      
# max_triple( [5, 1, 7, 3, 7, 8, 9]  ) # => 9      
# max_triple( [2, 2, 5, 1, 1]        ) # => 5

def max_triple( ary )
  first, last, middle = ary.first, ary.last, ary[(ary.length / 2)]
  return [first, last, middle].max
end