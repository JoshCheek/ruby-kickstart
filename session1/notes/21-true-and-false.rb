# Logic in Ruby operates on "boolean" objects. If I'm not lying, then they're named after the guy who invented logic!
# A boolean object is just an object that can be considered true or false.

# the true object:
true.class                      # => TrueClass
'yep, its true'   if true       # => "yep, its true"

# the false object:
false.class                     # => FalseClass
'nope, its not true' if false   # => nil

# you can flip them with a leading bang
!true     # => false
!false    # => true
!!true    # => true
!!false   # => false


# But what about all the other objects? They want to be boolean too!
# Turns out they can! (except nil, he can go sit in the corner with false)

[0, 1, "two", :three, Object.new, nil].each do |object|
  !!object # => true, true, true, true, true, false
end

