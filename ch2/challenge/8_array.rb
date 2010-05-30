# Return a version of the given array 
# where each zero in the array is replaced by the largest odd value to the right of the zero.
# If there is no odd value to the right of the zero, leave the zero as a zero.
# 
# zero_max( [0, 5, 0, 3])         # => [5, 5, 3, 3]
# zero_max( [0, 4, 0, 3])         # => [3, 4, 3, 3]
# zero_max( [0, 1, 0])            # => [1, 1, 0]

def zero_max( ary )
  ary.each_with_index do |element, index|
    if element == 0
      right_max = (ary[index..-1].reject { |i| i % 2 == 0 }).max
      ary[index] = right_max if right_max
    end
  end
end