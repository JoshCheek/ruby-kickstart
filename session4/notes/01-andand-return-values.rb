# Remember, everything in Ruby is true except for false and nil.
# This means that (1 && 5) returning 5 works just as well
# as if it had returned true. And in fact, that's what it does
# && returns the last object it looks at before making its decision.

# The LHS is true, so always returns the RHS.
1 && 5        # => 5
1 && nil      # => nil
1 && false    # => false
1 && true     # => true
1 && 'abc'    # => "abc"

# The LHS is false, so just returns the LHS
nil   && 1    # => nil
false && 1    # => false
