# The way you modify objects is through sequences of instructions called methods.
# For example, there is a set of instructions that know how to capitalize text. We group them into a method named capitalize.

"josh".capitalize # => "Josh"


# You can make methods, too!

def is_this_a_method?
  "Yes, it is!" # "Yes, it is!" is an object. Because this is the last object in the method, its address will be returned.
end

is_this_a_method? # => "Yes, it is!"

