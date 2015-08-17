#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/01-intro.rb file content is listed below
###############################################################################

# Origins of the Ruby Language:
#   Written By: Matz (Yukihiro Matsumoto)
#   First Public Release: 1995
#   Ruby is dynamic (interpreted), strongly typed (mostly), dynamically typed (known as duck typing)
#   Paradigms:
#     Procedural
#     OO (except for some operators, _everything_ is an object)
#     Functional

# Why Ruby?
#   It's hot! One of my instructors just sent this to our school's ACM mailing list:
#     % change in job openings from 2010
#     Ruby on Rails        +84%
#     Python               +53%
#     MySQL                +46%
#     PHP                  +43%
#     Ajax                 +37%
#     Linux                +31%
#     Perl                 +25%
#     Apache               +24%
#     Tomcat               +24%
#     Red Hat Linux        +21%
#
#     Source: Dice.com via May 9, 2011 ComputerWorld
#
#   Okay, but what about Ruby not Rails?
#     $ rvm list known
#
#     See MacRuby? I predict Apple moves from Objective C to MacRuby.
#     That means if you want to develop the Mac, you use Ruby, it means
#     iPhone development in Ruby. Remember what happened to Objective C
#     when the iPhone came out? That boost can shift towards Ruby.
#
#     See JRuby? The JVM is awesome, you have that power in Ruby. There
#     are awesome Java libraries. You have that power in Ruby. Native
#     threading in Ruby. Anywhere the JVM is (portability).
#
#   Rubyists are happy. We love to program. We love elegance.
#   We are changing the way others look at software. Ruby on Rails
#   exploded onto the scene because it allowed for incredibly rapid
#   development, it was beautiful and elegant in the face of "spaghetti code"
#   prominent in the web domain, and because it cared enough to do things "right"
#   even when that meant thinking completely outside what had been done before
#   and pushing boundaries.
#
# Think about it, you can conceive of your own problems. And you can solve them.
# You can create anything you can conceive of, like a brilliant architect.
# "Whoever holds the keys to programming ends up building the reality in which the rest of us live."
# -- Douglas Rushkoff


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/02-conventions.rb file content is listed below
###############################################################################

# In the notes, examples and cheat sheets provided, we use a few conventions in our code to make it easy
# to see the results of expressions. To show the results of a line, we use the following notation

3 + 9       # => 12
my_var = 4
my_var      # => 4

# This shows what that line evaluates to, and in the case of a line with just a variable on it, shows the value
# of the object it refers to.

# For more complicated output, such as from a print statement, it'll be placed below the code.


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/03-object-definition.rb file content is listed below
###############################################################################

# Ruby organizes related data, and the ways of manipulating it, into an abstract idea called an object.
# For example, the data that defines a number, and the methods on that number, define that number object.

# At a computer level, the data for the number 5 are just ones and zeros, probably looking like this
"%032b" % 5 # => "00000000000000000000000000000101"

# and since five is an object, it also has methods on it
5.even? # => false
5.odd?  # => true
5.next  # => 6


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/04-variables.rb file content is listed below
###############################################################################

# The data for the objects exist in a part of memory called the "heap"
# When Ruby wants to store an object, it goes to the heap, finds available memory, and then puts the object's data there.
# But how will we know where we put our object? We need something to keep track of that location (called its address).
#
# Variables are like little fingers that point to memory addresses!
# They let us keep track of where our objects are -- so you can access objects through variables.

five = 5   # five is a variable, 5 is the object it is pointing to

five.even? # => false
five.odd?  # => true
five.next  # => 6


# Variables can be set to point to new values

five           # => 5
five = "five"
five           # => "five"


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/05-methods.rb file content is listed below
###############################################################################

# The way you modify objects is through sequences of instructions called methods.
# For example, there is a set of instructions that know how to capitalize text. We group them into a method named capitalize.

"josh".capitalize # => "Josh"


# You can make methods, too!

def is_this_a_method?
  "Yes, it is!" # "Yes, it is!" is an object. Because this is the last object in the method, its address will be returned.
end

is_this_a_method? # => "Yes, it is!"


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/06-method-scope.rb file content is listed below
###############################################################################

# When you make a method, remember that it is its own little world,
# it doesn't know about anything outside of itself, this is called scope.

defined? twelve # => nil
twelve = 12
defined? twelve # => "local-variable"

def my_own_little_world
  defined? twelve # => nil
end

my_own_little_world # => nil
defined? twelve     # => "local-variable"


# Well that seems pretty useless, eh? Fortunately, there is an Internet connection on this world!
# You can pass objects, into the method. When we pass an object in, the variable that points to it
# is called an argument or a parameter

# person1 and person2 are arguments or parameters
def beam_me_up(person1, person2)
  "The away team consists of #{person1} and #{person2}."
end

beam_me_up("Ryker", "Data") # => "The away team consists of Ryker and Data."


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/07-method-arguments.rb file content is listed below
###############################################################################

# You know how you and I can go to the same website, but even though we both see it in our browser,
# is there only one website?
#
# Objects are the same way, when you pass one in, you can access it from the variable outside
# and inside the method, but there is still just one object.

def browser_goto(website)
  website.object_id     # => 2151945040, 2151945040
  "Direct your browser towards #{website}"
end

# the same object id means they are the same object
website = "ruby-kickstart.com"
website.object_id       # => 2151945040
browser_goto(website)   # => "Direct your browser towards ruby-kickstart.com"

# Ruby likes to be beautiful, it doesn't make you put parentheses where it can figure out what you meant.
browser_goto website    # => "Direct your browser towards ruby-kickstart.com"


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/08-operators.rb file content is listed below
###############################################################################

# There are some special methods called operators.
# They are special because the Ruby interpreter lets you use them in pretty ways, even though they are just methods.
# That's called syntactic sugar!

# there is a method named +
3.+(5)        # => 8

# but that's ugly, *ick*, Ruby is beautiful, so it lets you say
3 + 5         # => 8
2 - 4         # => -2
10 / 3        # => 3
10 % 3        # => 1

# See, it knows what to do :)
# (% tells you the remainder)

# Ruby wants to help you, but syntactic sugar wouldn't be much help
# if it changed the semantics of math, so Ruby respects order of operations.
2 * 3 + 10   # => 16
2 + 3 * 10   # => 32

# Question: If operators are just methods on objects, can other objects have operators?
# Lets open up irb and try it out!


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/09-numbers.rb file content is listed below
###############################################################################

# Because of real world limitations, math can't be implemented as purely as is done in the classroom.
# This means that while you think of 10 and 10.0 as the same thing, most programming languages don't.

10.class.ancestors    # => [Fixnum, Integer, Numeric, Comparable, Object, Kernel, BasicObject]
10.0.class.ancestors  # => [Float, Numeric, Comparable, Object, Kernel, BasicObject]

# They are both numbers (we haven't talked about classes yet, but notice that Numeric is in the ancestry)
# but they have slightly different behavior. For example, integer division gives an integer,
# but float division gives a float.
10    / 3 # => 3
10.0  / 3 # => 3.3333333333333335

# what if you want to convert them?
10.to_f   # => 10.0
10.0.to_i # => 10


# You can also use parentheses, they will take on the value of whatever is inside them.
(1 + 2) * 3     # => 9
(91 + 2).even?  # => false


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/10-introducing-strings.rb file content is listed below
###############################################################################

# For historical reasons, text in programming languages, is called a "string"
# think of it like you're stringing characters along a clothesline
# question: if 10.to_f converts 10 to a float, how would you convert 10 to a string?

"text".class # => String

# You can identify strings because they are surrounded in quotes

"abc" # => "abc"
'abc' # => "abc"


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/11-stdin-and-stdout.rb file content is listed below
###############################################################################

# Programs that run in a terminal read text in, and write text out.
# This is the common interface that allows lots of different programs to interact with each other.

# When a program outputs text, we say it sends it to standard output (stdout).
# In the terminal, anything your program sends stdout will display on your terminal.
# For example, cat sends a file's contents to standard output, echo sends its arguments to standard output.

# When it reads text in, it gets that from standard input (stdin).
# In the terminal, stdin is hooked up to your keyboard.
# Whatever you type will be sent to your program's stdin.

# Use gets to read a line from stdin
user_response = gets

# Use puts to write the line to stdout
puts "You said: #{user_response}"



# Watch out!
#
# A line is text that ends in a newline. line = "Line\n"
# When you read in the line, you also read in the newline.
# That means: line + line # => "Line\nLine\n"
#
# If you _actually_ wanted this: "LineLine"
# then you need to remove the newline.
#
# Ruby gives you a method named chomp that will give you that string without the newline
# line.chomp # => "Line"
# line       # => "Line\n"
#
# It's like a cookie monster for newlines!


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/12-puts.rb file content is listed below
###############################################################################

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


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/13-single-vs-double-quotes.rb file content is listed below
###############################################################################

# There are two ways to represent a literal String in Ruby: With double quotes ( "" ) or single quotes ( '' ).
# With double quotes, you can place special sequences, like newlines (\n) in the string that will be converted.
# With single quotes, the string comes out just as it's typed.

puts "Here's\nTwo lines."
puts 'This will\nonly be one line'

  # Output:
  # Here's
  # Two lines.
  # This will\nonly be one line


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/14-operators-on-strings.rb file content is listed below
###############################################################################

# You can use basic operators on Strings, just like other objects:

my_string   = "Face"
your_string = "book"

my_string + your_string  # => "Facebook"

my_string == your_string # => false
my_string = "book"
my_string == your_string # => true


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/15-interpolation.rb file content is listed below
###############################################################################

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


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/16-p.rb file content is listed below
###############################################################################

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


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/17-naming-conventions.rb file content is listed below
###############################################################################

# All the variables we've seen so far have been local variables.
# That means they exist within the current scope, but if we leave it, they go away.
# Local variables begin with a lowercase letter, and can then be followed by alphanumeric values and underscores
# Use snake_case with variables
local_variable = nil

# Constants are like variables, but you're telling the world that the value should not change.
# Any variable that starts with a capital letter is a constant.
# Use CamelCase with constants.
Constant = nil


# Instance variables are variables that belong to an object rather than a scope.
# Any variable that starts with an '@' sigil is an instance variable.
# We'll talk more about these later.
@instance_variable = nil


# Remember when I said methods were their own little worlds? I lied.
# Constants can be seen by anything defined in their scope.

MyConstant  = 12
my_variable = 13
def example
  begin
    MyConstant        # => 12
    my_variable       # =>
  rescue => exception
    exception         # => #<NameError: undefined local variable or method `my_variable' for main:Object>
  end
end

example # invokes the method


# Question: classes begin with uppercase letters, are they constants?
#   Remember, constants are just variables that aren't supposed to change.
#   go test this in irb


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/18-keywords.rb file content is listed below
###############################################################################

# We care about keywords, because they have special meaning to Ruby.
# This means that we can't use them as variable names.
#
# You will know if you've used one, because the interpreter will
# If your text editor highlights it, don't use it. :)
#
# If you _really_ want a list, its at http://www.google.com/search?&q=ruby+keywords+list




# def is a keyword used for defining methods. It has special meaning, you can't use it.

def = 3 # !> useless use of a literal in void context
# ~> -:14: syntax error, unexpected '='
# ~> def = 3 # !> useless use of a literal in void context
# ~>      ^


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/19-nil.rb file content is listed below
###############################################################################

# There is a special object named nil
nil.class # => NilClass

# It's the object you use when you need to represent that you don't have an object!
array = [1,5,7]
array.find { |number| number * 2 == 10 } # => 5
array.find { |number| number * 2 == 11 } # => nil


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/20-logic.rb file content is listed below
###############################################################################

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


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/21-true-and-false.rb file content is listed below
###############################################################################

# Logic in Ruby operates on "boolean" objects. If I'm not lying, then they're named after the guy who invented logic!
# A boolean object is just an object that can be considered true or false.

# the true object:
true.class                      # => TrueClass
'yep, its true'   if true       # => "yep, its true"

# the false object:
false.class                     # => FalseClass
'nope, its not true' if false   # => nil

# you can flip them with a leading bang
!true     # => false
!false    # => true
!!true    # => true
!!false   # => false


# But what about all the other objects? They want to be boolean too!
# Turns out they can! (except nil, he can go sit in the corner with false)

[0, 1, "two", :three, Object.new, nil].each do |object|
  !!object # => true, true, true, true, true, false
end


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/22-if-else.rb file content is listed below
###############################################################################

# Lets say you actually want to do something conditionally

if 4 == (2 + 2)
  "I get evaluated"   # => "I get evaluated"
else
  "I don't :("        # =>
end


my_number = 56

if my_number < 12
  puts "Fewer than a dozen"
elsif my_number < 64
  puts "You could hold me in 6 bits"
else
  puts "That's a pretty big number"
end

  # Output:
  # You could hold me in 6 bits
  #


'one line if statement'     if true       # => "one line if statement"
'one line unless statement' unless false  # => "one line unless statement"


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/23-if-returns-a-value.rb file content is listed below
###############################################################################

# Anywhere you can write code in Ruby returns a value, including if statements.

result = if true
  "yep, it's true"
else
  "nope, it's not true"
end

result # => "yep, it's true"



# Lets put that in a method
def if_returns_value(bool)
  if bool
    "yep it's true"
  else
    "nope, it's not true"
  end
end

if_returns_value true     # => "yep it's true"
if_returns_value false    # => "nope, it's not true"



# So does unless
def unless_returns_value(bool)
  unless bool
    "nope, it's not true"
  else
    "yep, it's true"
  end
end

unless_returns_value true   # => "yep, it's true"
unless_returns_value false  # => "nope, it's not true"


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session1/notes/24-go-do-the-challenges.rb file content is listed below
###############################################################################

# Okay, we made it through :)
# Now you just need to go do the challenges
#
# Open up the challenges in your text editor. Try to complete the first one.
# Then go to the terminal, and navigate to the directory with the Rakefile in it.
# Then run $ rake 1:1
#
# Did you pass? No?
# Okay, look at the output and try again. See what went wrong?
# Try again!
#
# Did you pass? Yeah?
# Great! No go finish the rest :D



# !!!!!!!!!!DON'T FORGET!!!!!!!!!
# There are cheat sheets to help you. You will need to reference them!
#
# How should you use the cheat sheets?
# Read them once so you know what kinds of things they contain.
# Then when you need to use something, first try to remember what it was.
# If you can't remember, then go look it up.
# Make a point of focusing on the answer, and try to recall it again immediately.
# This will help you quickly learn the things you want to use.
#
# You don't need to sit down and try to memorize the whole sheet (if you want to, you can)
# It's mostly important to know what general things they contain, and begin to memorize
# the parts that you use frequently.
#

# For this section, you'll need:
# https://github.com/JoshCheek/ruby-kickstart/blob/master/cheatsheets/logic_and_control.rb
# https://github.com/JoshCheek/ruby-kickstart/blob/master/cheatsheets/strings.rb


################################## -- END -- ##################################



