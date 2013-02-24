# Every instance of the symbol is the same object,
# notice they have the same object id.
:this_is_a_symbol.object_id # => 212668
:this_is_a_symbol.object_id # => 212668

# Whereas each String is a new object,
# notice they have different object ids.
'this is a string'.object_id # => 2149403240
'this is a string'.object_id # => 2149402020


# This makes them easy to test equality. For a symbol you just check
# if it is the same object, but for a String, you must check that
# each character is the same character (iterate through the entire
# string) this gives symbols a performance boost for checking
# equality.


# you typically use symbols in a situation where you wish to use
# a constant, but want it to be named, like a String
