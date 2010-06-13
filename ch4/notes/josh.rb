# =====  Boolean Methods  =====
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
# name1 is falsy, so it returns the evaluation of (session[:name] || DEFAULT_NAME)
# session[:name] returns 'Kris', which is truthy, short circuiting the || so that DEFAULT_NAME never gets evaluated

def login_name() nil end        # code to check if user logged in and return their name or nil
session = { :name => 'Kris' }   # hash of user info stored in cookie on user's browser
DEFAULT_NAME = 'John Doe' 

username = login_name || session[:name] || DEFAULT_NAME
username  # => "Kris"



# =====  Introspection / Reflection  =====
# take a look at the cheatsheet


# =====  Ranges  =====
# ranges look like this
1..5      # => 1..5
1...5     # => 1...5

# 2 dots includes the end
# 3 dots excludes the end
# they are iterable, using the methods mixed in by Enumerable class


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
contents = Array.new
File.open("names") { |file| contents << file.read }
contents  # => ["sally\nsam\nbillybob\n"]

# Iterate over the lines of the file
contents = Array.new
File.open "names" do |file|
  file.each { |line| contents << line }  # files are iterable too
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
kevin.singleton_methods             # => ["farewell", "greet"]

class << kevin
  attr_accessor :test
end
kevin.test = 100
kevin.test                          # => 100
kevin.singleton_methods             # => ["farewell", "test=", "greet", "test"]
kevin                               # => "Kevin Griffin"
"Kevin Griffin".singleton_methods   # => []


# =====  Inheritence  =====
# Note: Breeze through this shit, mostly doing it b/c I feel an OO obligation
# 
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
Employee.singleton_methods        # => ["dollars_per_hour", "dollars_per_hour="]
Clerk.singleton_methods           # => ["dollars_per_hour", "dollars_per_hour="]
Engineer.singleton_methods        # => ["dollars_per_hour", "dollars_per_hour="]

# Where did Engineer get it from? We never defined dollars_per_hour for Engineer
Engineer.method(:dollars_per_hour).owner  # => #<Class:Employee>

# It came from Employee's singleton class (the class that stores methods that are defined on objects)
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
# Comparable
module JoshEnum
  def map
    result = Array.new
    each do |obj|
      result << yield(obj)
    end
    result
  end
end


class Person
    
  include JoshEnum
    
  def initialize(age)
    @age = age
  end

  def age
    @age
  end
  
  def each
    0.upto(age) { |i| yield i }
  end
  
end

josh = Person.new 10

birthdays = josh.map do |age|
  "has been alive for #{age} years"
end

require 'pp'

pp birthdays



# rubygems
# >> ["has been alive for 0 years",
# >>  "has been alive for 1 years",
# >>  "has been alive for 2 years",
# >>  "has been alive for 3 years",
# >>  "has been alive for 4 years",
# >>  "has been alive for 5 years",
# >>  "has been alive for 6 years",
# >>  "has been alive for 7 years",
# >>  "has been alive for 8 years",
# >>  "has been alive for 9 years",
# >>  "has been alive for 10 years"]
