# Programs that run in a terminal read text in, and write text out. 
# This is the common interface that allows lots of different programs to interact with each other.

# When a program outputs text, we say it sends it to standard output.
# In the terminal, anything sent to standard output will display on your terminal.
# For example, cat sends a file's contents to standard output, echo sends its arguments to standard output.

# Ruby has several methods for outputting text, the most common of which is 'puts':
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
