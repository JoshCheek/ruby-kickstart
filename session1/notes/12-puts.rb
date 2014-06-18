# Ruby has several methods for sending text to stdout, the most common of which is 'puts':
puts "Welcome to the program!"

  # Output:
  # Welcome to the program!
  #


# Notice that puts places a newline after whatever it prints. And puts can print any object, not just strings:
puts 45

  # Output:
  # 45
  #


# puts can output other objects by using their to_s method to convert them into Strings
# and then outputs the strings. It works like this:
number = 56
thing_to_print = number.to_s
puts thing_to_print

  # Output:
  # 56
  #

