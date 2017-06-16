# Given a nonnegative integer, return a hash whose keys are all the odd nonnegative integers up to it
# and each key's value is an array containing all the even non negative integers up to it.
#
# Examples:
# staircase 1  # => {1 => []}
# staircase 2  # => {1 => []}
# staircase 3  # => {1 => [], 3 => [2]}
# staircase 4  # => {1 => [], 3 => [2]}
# staircase 5  # => {1 => [], 3 => [2], 5 =>[2, 4]}

def staircase(n)
  # Create a new empty hash
  hash = {}
  #C Count from 1 up to the n parameter
  1.upto n do |size|
    # Skip over even numbers with even?
    next if size.even?
    # Variable that contains an array of numbers upto n
    all = Array.new(size) { |i| i + 1 }
    # Variable that contains an array of all even integers
    evens = all.select { |i| i.even? }
    # Populate the hash variable
    hash[size] = evens
  end
  p hash
end

staircase 5
