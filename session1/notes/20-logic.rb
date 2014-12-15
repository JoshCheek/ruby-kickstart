# In your life, when you need to conditionally do something, you use logic.
# Logic has two values: true and false.
# You say things like "if it's raining and I have an umbrella I'll go outside, otherwise I'll stay inside."
# This is a logical statement.
#
# Ruby has logic, too, so you can totally write a program to see if you should go outside, in fact, lets do it!

def go_outside?(raining, umbrella)
  raining && umbrella
end

go_outside?(true,  true)   # => true
go_outside?(true , false)  # => false
go_outside?(false, true )  # => false
go_outside?(false, false)  # => false

# Look, the go_outside? method knows exactly what to do, because it knows about logic!

