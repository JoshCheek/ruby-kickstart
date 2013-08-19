=begin rdoc

<b>The way you modify objects is through sequences of instructions called methods.
For example, there is a set of instructions that know how to capitalize text. We group them into a method named capitalize.</b>

 "josh".capitalize # => "Josh"



<b>You can make methods, too!</b>

 def is_this_a_method?
  "Yes, it is!" 
 end
<b>"Yes, it is!" is an object.</b> 
<b>Because this is the last object in the method, its address will be returned.</b>
 is_this_a_method? # => "Yes, it is!"

=end