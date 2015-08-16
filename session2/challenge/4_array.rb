# Write a method named get_squares that takes an array of numbers
# and returns a sorted array containing only the numbers whose square is also in the array
#
# get_squares [9]                      # => []
# get_squares [9,3]                    # => [3]
# get_squares [9,3,81]                 # => [3, 9]
# get_squares [25, 4, 9, 6, 50, 16, 5] # => [4, 5]

# This time you will have to define the method, it's called: get_squares
def get_squares num_array
	result = []
	num_array.each{|x| result << x if num_array.include?(x**2)}
	result.sort!
end

#puts "#{get_squares([9,3,81,5,25])}" 
