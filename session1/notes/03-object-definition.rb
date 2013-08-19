=begin rdoc

<b>Ruby organizes related data, and the ways of manipulating it, into an abstract idea called an object.
For example, the data that defines a number, and the methods on that number, define that number object.</b>

<b>At a computer level, the data for the number 5 are just ones and zeros, probably looking like this.</b>

 "%032b" % 5 # => "00000000000000000000000000000101"

<b>Since five is an object, it also has methods on it.</b>

 5.even? # => false
 5.odd?  # => true
 5.next  # => 6

=end