# Ruby organizes related data, and the ways of manipulating it, into an abstract idea called an object.
# For example, the data that defines a number, and the methods on that number, define that number object.

# At a computer level, the data for the number 5 are just ones and zeros, probably looking like this
"%032b" % 5 # => "00000000000000000000000000000101"

# and since five is an object, it also has methods on it
5.even? # => false
5.odd?  # => true
5.next  # => 6

