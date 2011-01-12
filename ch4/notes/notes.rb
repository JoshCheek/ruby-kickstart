# =====  Boolean Return Values  =====
# **REMEMBER: Everything is considered true in Ruby, except false and nil**
#
# you've already seen basic boolean methods
# but if 1 is considered true, and we say 
# y = 1
# expression if y && x
# then the only thing we care about is if x is "truthy"
# meaning, if x is 5, the whole thing evaluates the same as if x is true
y , x = 1 , 5
expression = 'evaluated'
expression if y && x # => "evaluated"

x = false
expression if y && x # => nil


# this implies that true and false aren't as important as "evaluates like true"
# and "evaluates as false"
#
# so when evaluating 1 && 5, 1 is truthy, and it can just return the 5.
# it does not need to evaluate the truth value of the 5, because whatever is using it
# will do that for it 
1 && 5        # => 5
1 && nil      # => nil
1 && false    # => false
1 && true     # => true
1 && 'abc'    # => "abc"

# what if the first parameter to && was not truthy? Then it is falsey
# Then it does not need to explicitly return false, it can just return that value
nil   && 1    # => nil
false && 1    # => false

# the same short circuit principle applies to ||
1     || nil      # => 1
nil   || 1        # => 1
"abc" || false    # => "abc"
false || "abc"    # => "abc"


# This opens the way for some interesting uses of boolean values: 
# login_name is falsy, so it returns the evaluation of (session[:name] || DEFAULT_NAME)
# session[:name] returns 'Kris', 
# which is truthy, short circuiting the || so that DEFAULT_NAME never gets evaluated

def login_name() nil end        # code to check if user logged in and return their name or nil
session = { :name => 'Kris' }   # hash of user info stored in cookie on user's browser
DEFAULT_NAME = 'John Doe' 

username = login_name || session[:name] || DEFAULT_NAME
username  # => "Kris"



# =====  Introspection / Reflection  =====
# see the cheatsheet for more info

# the most important ones are:
"abc".class       # => String
String.ancestors  # => [String, Enumerable, Comparable, Object, Kernel]

# puts calls to_s, p calls inspect, it returns a String representation that represents
# the object and its state in a way that is hopefully easy to understand and unambiguous
# Strings for example, get quotes placed around them.
"abc"                                   # => "abc"
"abc".inspect                           # => "\"abc\""
"abc".to_s                              # => "abc"

[1,2,3]                                 # => [1, 2, 3]
[1,2,3].inspect                         # => "[1, 2, 3]"
[1,2,3].to_s                            # => "123"

{ 1 => 2 , :three => [4,5,6] }          # => {1=>2, :three=>[4, 5, 6]}
{ 1 => 2 , :three => [4,5,6] }.inspect  # => "{1=>2, :three=>[4, 5, 6]}"
{ 1 => 2 , :three => [4,5,6] }.to_s     # => "12three456"


# =====  Ranges  =====
# see the cheatsheet for more info

# ranges look like this
1..5      # => 1..5
1...5     # => 1...5

# 2 dots includes the end
# 3 dots excludes the end
# they are iterable, using the methods mixed in by Enumerable class
iterated = Array.new
(1..5).each { |n| iterated << n }
iterated                            # => [1, 2, 3, 4, 5]

(1...5).map { |n| n * 5 }           # => [5, 10, 15, 20]
('a'..'z').to_a                     # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]


# =====  Simple File IO  =====
# docs: http://ruby-doc.org/core/classes/File.html
#       http://ruby-doc.org/core/classes/IO.html
#
#
# file output basically works the same way as regular output, because a File object is an IO object
# and $stdout and $stdin, are also IO objects.

# you can do this in a non block form, but it is easy to forget to close it, 
# or cause an exception which bypasses it, so unless you have some very specific reason, you should use the block form

# Writing to a file
File.open "names" , "w" do |file|
  file.puts   "sally"
  file.puts   "sam"
  file.print  "billy"
  file.print  "bob"
  file.puts
end

# Read the entire file at once
contents = File.read "names"
contents  # => "sally\nsam\nbillybob\n"

# Iterate over the lines of the file
contents = Array.new
File.foreach "names" do |line|
  contents << line
end
contents # => ["sally\n", "sam\n", "billybob\n"]

# Read each line from the file into an array
File.readlines "names" # => ["sally\n", "sam\n", "billybob\n"]

# Cleaning up
File.exist? "names" # => true
File.delete "names"
File.exist? "names" # => false




# =====  Singleton Methods  =====
# You can open an *individual object* and add methods to it
# This is the kind of power that a dynamic language provides to you

# kevin is an instance of String 
kevin = "Kevin Griffin"

# lets open the kevin object and give it methods
class << kevin
  def greet
    "What's going on?"
  end
end

# we can also define a method on kevin like this
def kevin.farewell
  "See you later."
end

kevin                               # => "Kevin Griffin"
kevin.class                         # => String
kevin.greet                         # => "What's going on?"
kevin.farewell                      # => "See you later."
kevin.singleton_methods             # => ["greet", "farewell"]

class << kevin
  attr_accessor :test
end
kevin.test = 100
kevin.test                          # => 100
kevin.singleton_methods             # => ["greet", "test=", "farewell", "test"]
kevin                               # => "Kevin Griffin"
"Kevin Griffin".singleton_methods   # => []




# =====  Singleton Class  =====
# Methods are defined on classes and modules. For an object to be able to use a method,
# it must be an instance of the class, or have the module in its ancestor chain.
# To make methods available to one specific object, what class should you define it on?
# On its singleton class. This is a class that exists only for the given object.
# Any methods you put on it will be available to that object only.

josh = "josh"
zac  = "zac"

# josh and zac's actual class
class String
  def this_is_on_all_strings
  end
end

# josh's singleton class
class << josh
  def this_is_available_only_to_josh
  end
end

josh.methods.grep(/this/) # => ["this_is_on_all_strings", "this_is_available_only_to_josh"]
zac.methods.grep(/this/)  # => ["this_is_on_all_strings"]




# =====  Inheritence  =====
# Sometimes you have a generic idea of your class, but it can be realized in several specific ways
# Commonly, in Object Oriented Programming, we will subclass the generic class, and write more specific implementations.
class Employee
  
  # Class methods are available to inherited classes
  # Class methods are instance methods for the class itself (remember, the class is an object)
  class << self
    attr_accessor :dollars_per_hour
  end
  
  attr_accessor :hours_worked
  
  def initialize( hours_worked )
    self.hours_worked = hours_worked
  end
  
  def wages
    self.class.dollars_per_hour * hours_worked
  end
  
end


# even though we didn't define an attr_accessor for the Clerk
# it inherits that code from the Employee
class Clerk < Employee
  self.dollars_per_hour = 20
end


class Engineer < Employee
  self.dollars_per_hour = 30

  # in addition to getting paid by the hour, the Engineer gets
  # an additional base $500 per month
  def wages
    super + 500     # we can use super to invoke the wages method we inherited from employee
  end
end



# well each of these classes has methods for dollars_per_hour
Employee.methods.grep(/dollars/)  # => ["dollars_per_hour", "dollars_per_hour="]
Clerk.methods.grep(/dollars/)     # => ["dollars_per_hour", "dollars_per_hour="]
Engineer.methods.grep(/dollars/)  # => ["dollars_per_hour", "dollars_per_hour="]

# Where did Engineer get it from? We never defined dollars_per_hour for Engineer
Engineer.method(:dollars_per_hour).owner  # => #<Class:Employee>

# It came from Employee's singleton class (the class that stores methods that are defined on one given object)
# How do we have access to Employee's Singleton class? We inherit from Employee
Engineer.superclass               # => Employee

# who else do we inherit from?
Engineer.ancestors                # => [Engineer, Employee, Object, Kernel]




# Bill is a clerk, he makes 160 hours * $20 per hour = $3200
bill = Clerk.new 160
bill.wages  # => 3200


# Ayaan is an engineer, she makes 160 hours * $30 per hour + $500 per month = $5300
ayaan = Engineer.new 160
ayaan.wages # => 5300




# =====  Modules  =====
# Generally, inheriting classes is becoming less embraced by the Ruby community
# Now, people usually prefer to use modules instead of inheritence.
# A class can only inherit from one other class, but it can include as many modules as it likes (this is commonly called a mix-in)
#
# Modules have the feel of a class in that they have methods on them. But they cannot be instantiated.
# Instead, you declare that the methods in the module should extend an object, or be included in a class
# and all the methods the module contains will be magically dropped into the class.
module Threes
  
  def threes_r0
    self.select { |i| i % 3 == 0 }
  end
  
  def threes_r1
    select { |i| i % 3 == 1 }
  end
  
  def threes_r2
    select { |i| i % 3 == 2 }
  end
  
end


# Extending an object with a module
sequence = 0...30
sequence.extend Threes


# if we look in sequence's singleton class, we see that Threes is now an ancestor of it
# but this has only affected our one object
(class << sequence; self; end).ancestors # => [Threes, Range, Enumerable, Object, Kernel]
(class << Range.new(0,0); self; end).ancestors # => [Range, Enumerable, Object, Kernel]

sequence.threes_r0 # => [0, 3, 6, 9, 12, 15, 18, 21, 24, 27]
sequence.threes_r1 # => [1, 4, 7, 10, 13, 16, 19, 22, 25, 28]
sequence.threes_r2 # => [2, 5, 8, 11, 14, 17, 20, 23, 26, 29]

sequence                          # => 0...30
0...30                            # => 0...30
sequence.methods.grep(/threes/)   # => ["threes_r0", "threes_r1", "threes_r2"]
(0...30).methods.grep(/threes/)   # => []

# Questions: Where did the select come from in threes_rn?
#            Can you think of another object we could extend with this module?


# Including a module in a class' instance methods
# A class has lots of instance methods that its instances are able to use
# You can include the module's methods in them as well
Range.ancestors                   # => [Range, Enumerable, Object, Kernel]
class Range
  include Threes
end
Range.ancestors                   # => [Range, Threes, Enumerable, Object, Kernel]

sequence                          # => 0...30
0...30                            # => 0...30
sequence.methods.grep(/threes/)   # => ["threes_r0", "threes_r1", "threes_r2"]
(0...30).methods.grep(/threes/)   # => ["threes_r0", "threes_r1", "threes_r2"]



# Modules are also commonly used for namespacing
# maybe you want to try the same problem several days in a row, to see how your approach changes
module Day1Solutions
  class MinFinder
    def initialize(a,b)
      @a , @b = a , b
    end
    def solve
      if @a < @b then @a else @b end
    end
  end
end

module Day2Solutions
  class MinFinder
    def initialize(a,b)
      @elements = [ a , b ]
    end
    def solve
      @elements.min
    end
  end
end

day1 = Day1Solutions::MinFinder.new 10 , 5
day2 = Day2Solutions::MinFinder.new 10 , 5
day1                                          # => #<Day1Solutions::MinFinder:0x1011dcf20 @b=5, @a=10>
day2                                          # => #<Day2Solutions::MinFinder:0x1011dce58 @elements=[10, 5]>
day1.solve                                    # => 5
day2.solve                                    # => 5

# that is a lot to type, though, I think I like Day2Solutions better, it's easier to read
# that is the one I want to use from now on, but I don't want to have to keep typing Day2Solutions::MinFinder.new
# we can include day2 solutions into our main
include Day2Solutions
MinFinder.new 10 , 5                          # => #<Day2Solutions::MinFinder:0x1011d77c8 @elements=[10, 5]>

# This is a common way to get nicer functionality
# For example, the FileUtils module (http://ruby-doc.org/core/classes/FileUtils.html), which is in the Ruby standard library
# is included when working with rake files, this lets you say things like "cd 'ch4'" instead of "FileUtils.cd 'ch4'"

