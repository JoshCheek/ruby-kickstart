# Write a function named mod_three which takes an array of numbers, 
# and return a new array consisting of their remainder when divided by three.
# Exclude any numbers which are actually dividible by three.
# 
# EXAMPLES:
# mod_three [0]  # => []
# mod_three [1]  # => [1]
# mod_three [2]  # => [2]
# mod_three [3]  # => []
# mod_three [4]  # => [1]
# mod_three [5]  # => [2]
# mod_three [6]  # => []
# mod_three [7]  # => [1]
#
# mod_three [0,1,2,3,4,5,6,7] # => [1, 2, 1, 2, 1]

def mod_three num_array
	num_array.select{|x| x % 3 != 0}.collect!{|y| y%3}
end

#puts "#{mod_three([0,1,2,3,4,5,6,7])}"
#puts "#{mod_three([1])}"

