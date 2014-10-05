# One other important output method is the 'p' method. p outputs an object's internal representation:
# think of it as how the object looks in code. This kind of output is what we've been putting to the right of
# lines of code in these notes.

puts "Rain and lightning"
p    "Rain and lightning"

  # Output of puts:
  # Rain and lightning

  # Output of p:
  # "Rain and lightning"


# Notice how the p method puts quote ( "" ) around the string. Here's one more example.
# (in Ruby, a list of objects is called an array. We'll talk about arrays later)

array = [1, 2, 3]

puts array
p    array

# Output:

  # puts:
  # 1
  # 2
  # 3

  # p:
  # [1, 2, 3]

