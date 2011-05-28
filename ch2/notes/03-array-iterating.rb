numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# Use each to iterate, and pass a block
# We'll cover blocks more later
sum = 0
numbers.each { |number| sum += number }
sum # => 45


# Use map to make a new array out of the elements 
# returned by the block
squares = numbers.map { |number| number * number }
squares # => [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
numbers # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
