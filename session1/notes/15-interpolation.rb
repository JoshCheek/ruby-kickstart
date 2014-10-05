# Double quotes have even more power. By using a special sequence of characters, you can interpolate code
# into your String. That code will be ran and its results placed into the string.

small_number = 5
neg_number = -97

puts "1 + 3 is #{1 + 3}"
puts "My two numbers are #{small_number} and #{neg_number.abs} (all positive here)"

  # Output:
  # 1 + 3 is 4
  # My two numbers are 5 and 97 (all positive here)
  #

# Notice we can do anything inside of the #{} we want, including referencing objects and calling methods on them.

