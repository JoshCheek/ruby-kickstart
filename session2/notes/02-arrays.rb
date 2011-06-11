# Arrays are ordered lists of objects.
array = ['zero', 'one', 'two']


# You access a given element by its index,
# beginning at zero
array[0] # => "zero"
array[1] # => "one"
array[2] # => "two"


# If you go past the end, you get back nil
array[3] # => nil


# Negative indexes backwards from the end
array[-1] # => "two"
array[-2] # => "one"
array[-3] # => "zero"


# Arrays know where the elements at their indexes are this
# means it is just as cheap to look up an element really
# deep as it is for an element right at the beginning.
array = (0...5000).to_a # the numbers 1 to 5k


# about half a second to access element at index 2500
start_time = Time.now
5_000_000.times { array[2500] }
Time.now - start_time # => 0.545612


# about half a second to access element at index 0
start_time = Time.now
5_000_000.times { array[0] }
Time.now - start_time # => 0.545922
