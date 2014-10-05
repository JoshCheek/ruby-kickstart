# The data for the objects exist in a part of memory called the "heap"
# When Ruby wants to store an object, it goes to the heap, finds available memory, and then puts the object's data there.
# But how will we know where we put our object? We need something to keep track of that location (called its address).
#
# Variables are like little fingers that point to memory addresses!
# They let us keep track of where our objects are -- so you can access objects through variables.

five = 5   # five is a variable, 5 is the object it is pointing to

five.even? # => false
five.odd?  # => true
five.next  # => 6


# Variables can be set to point to new values

five           # => 5
five = "five"
five           # => "five"

