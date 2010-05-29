# Return an array that contains the exact same numbers as the given array, 
# but rearranged so that all the zeros are grouped at the start of the array. 
# The order of the non-zero numbers does not matter. 
# So {1, 0, 0, 1} becomes {0 ,0, 1, 1}. 
# 
# You may modify and return the given array or make a new array. 
# 
# zero_front( [1, 0, 0, 1]      ) # => [0, 0, 1, 1]
# zero_front( [0, 1, 1, 0, 1]   ) # => [0, 0, 1, 1, 1]
# zero_front( [1, 0]            ) # => [0, 1]

def zero_front( ary )
  ary.select { |e| e == 0 } + ary.reject { |e| e == 0 }
end
