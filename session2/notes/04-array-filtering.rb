numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]


# Use select to make a new array of only the elements
# you want if the block returns a truthy value then
# that element will be in the result.
evens = numbers.select { |number| number.even? }
evens   # => [0, 2, 4, 6, 8]


# Reject is the opposite
odds = numbers.reject { |number| number.even? }
odds    # => [1, 3, 5, 7, 9]


# None of these modify the original array
# They all return new arrays
numbers # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
