# =====  Introduction to Ruby  =====
# Origins of the Ruby Language:
# Written By: Matz (Yukihiro Matsumoto)
# First Public Release: 1995
# Ruby is dynamic (interpreted), strongly typed (mostly), dynamically typed (known as duck typing)
# Paradigms:
#   Procedural
#   OO (except for some operators, _everything_ is an object)
#   Functional

# ==== Conventions =====

# In the notes, examples and cheatsheets provided, we use a few conventions in our code to make it easy
# to see the results of expressions. To show the results of a line, we use the following notation

3 + 9       # => 12
my_var = 4
my_var      # => 4

# This shows what that line evaluates to, and in the case of a line with just a variable on it, shows the value
# of the object it refers to.

# For more complicated output, such as from a print statement, it'll be placed below the code.


# ===== Ruby Basics ====

# Ruby is dynamic, so there's no need to declare variables ahead of time
my_string = "Welcome to Ruby"
my_num    = 15532

# Notice that a variable isn't bound to holding one type of object, even after it's been assigned:
my_num    = "Now a string"

# Arithmetic operators work similar to other languages

3 + 5        # => 8
2 - 4        # => -2
10 / 3       # => 3
10 % 3       # => 1
2 * 3 + 10   # => 16
2 + 3 * 10   # => 32
             
my_var = 4   # => 4

my_var += 10 # => 14
my_var       # => 14

# =====  Objects  =====

# Ruby is a purely Object-Oriented programming language.
# there are no primitives; everything is an object: 
# Classes are objects, methods are objects, operators are objects, integers are objects
# Where other languages might use a function, objects in Ruby have a method to perform the action themselves:

# Java: postive_num = Math.abs(-4)

# Ruby:

positive_num = -47.abs    # => 47

# Conversions to string and float                          
6457.to_s                 # => "6457"
-98.to_f                  # => -98.0

# Note here that the '?' is part of the method name, 'even?'
(91 + 2).even?            # => false


# ===== Output and Strings ====

# Ruby has several methods for output, the most common of which is 'puts':

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

# There are two ways to represent a literal String in Ruby: with double quotes ( "" ) or single quotes ( '' )
# With double quotes, you can place special sequences, like newlines (\n) in the string that will be converted
# With single quotes, the string comes out just as it's typed.

puts "Here's\nTwo lines."
puts 'This will\nonly be one line'

# Output:
# Here's
# Two lines.
# This will\nonly be one line

# You can use basic operators on Strings, just like other objects:

my_string   = "Face"
your_string = "book"

my_string + your_string  # => "Facebook"

my_string == your_string # => false
my_string = "book"
my_string == your_string # => true


# Double quotes have even more power. By using a special sequence of characters, you can interpolate code
# into your String. That code will be ran and its results placed into the string.

small_number = 5
neg_number   = -97

puts "1 + 3 is #{1 + 3}"
puts "My two numbers are #{small_number} and #{neg_number.abs} (all positive here)"

# Output:
# 1 + 3 is 4
# My two numbers are 5 and 97 (all positive here)

# Notice we can do anything inside of the #{} we want, including referencing objects and calling methods on them.

# One other important output method is the 'p' method. p outputs an object's internal representation:
# think of it as how the object looks in code. This kind of output is what we've been putting to the right of 
# lines of code in these notes.

puts "Rain and lightning"
p    "Rain and lightning"

# Output:

  # puts:
  # Rain and lightning

  # p:
  # "Rain and lightning"

# Notice how the p method puts quote ( "" ) around the string. Here's one more example using arrays
# (We'll talk about arrays themselves later on)

my_array = [1, 2, 3]

puts my_array
p    my_array

# Output:

# puts
# 1
# 2
# 3

# p
# [1, 2, 3]

# =====  Identifiers and Variables  =====

# The standard naming conventions for variable names (identifiers) apply in Ruby, like not starting with a number.
# However, in Ruby, naming conventions are important: constants always start with capital letters, and
# instance variables start with the '@' symbol, for example.

# The scope of constants scope should cascade down such that anything defined 
# in a scope nested in the defined scope, will be able to access them. ie

MyConstant  = 12
my_variable = 13
class Example
  begin
    MyConstant        # => 12
    my_variable 
  rescue => exception
    exception         # => #<NameError: undefined local variable or method `my_variable' for Example:Class>
  end
end


# =====  Keywords  ====
# If your text editor highlights it, don't use it. :)


# =====  Logic  =====

# In Ruby, there are two things that are false: false and nil. Everything else (including 0) is true.

# Ruby has standard if-else constructs

if 4 == (2 + 2)
  puts "I get to execute!"
else
  puts "I don't :("
end

my_number = 56

if my_number < 12
  puts "Fewer than a dozen"
elsif my_number < 64
  puts "You could hold me in 6 bits"
else
  puts "That's a pretty big number"
end

# Ruby also has a nice syntax for one-line conditionals, by placing the 'if' at the end of the line:

puts "Here we go" if 120.even?