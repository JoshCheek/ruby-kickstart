=begin rdoc

<b>Because of real world limitations, math can't be implemented as purely as is done in the classroom.
This means that while you think of 10 and 10.0 as the same thing, most programming languages don't.</b>

 10.class.ancestors    # => [Fixnum, Integer, Numeric, Comparable, Object, Kernel, BasicObject]
 10.0.class.ancestors  # => [Float, Numeric, Comparable, Object, Kernel, BasicObject]

<b>They are both numbers ( we haven't talked about classes yet, but notice that Numeric is in the ancestry )
but they have slightly different behaviour. For example, integer division gives an integer, but float division gives a float.</b>
 10    / 3 # => 3
 10.0  / 3 # => 3.3333333333333335

<b>What if you want to convert them?</b>
 10.to_f   # => 10.0
 10.0.to_i # => 10

<b>You can also use parentheses, they will take on the value of whatever is inside them.</b>
 ( 1 + 2 ) * 3     # => 9
 ( 91 + 2 ).even?  # => false

=end