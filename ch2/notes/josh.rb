# josh's notes for presenting ch2

# =====  Stdout  =====
# Java                  Ruby
# System.out.println    puts
# System.out.print      print
# System.out.printf     printf
#                       p
#                   
#
# all IO have these methods (ie files)
# show example 1


# ====  Input  =====
# Java's scanner.nextLine() is Ruby's gets
# You can read all lines into array with readlines
# You can read everything until eof into a string with read
# for more complicated usage, you can use strscan, its in the stdlib (I never use it)


# =====  Arrays  =====
# go over the example


# =====  Classes  =====
# A class allows you to define methods relevant to specific types of objects
# Array is a class, String is a class
#
# A specific array is said to be an instance of the Array class.
# [1,2,3] is an instance of Array
# [9,8,7] is an instance of Array
# "hello" is an instance of String
# "boats" is an instance of String
#
# Between "yankees" and "baseball team" which is a class and which is an instance? Ask for another instance.
#
# Person would be a class
# josh would be an instance of it. Other instances might be daniel, lissa, kevin, kris, and michael


# =====  Class and Instance Variables  =====
# Instances have instance variables, a variable that is unique to each instance (for Person, an instance variable might be @name)
# they begin with an @, and can be accessed from any instance method in the object
@my_ivar = 'hi'
instance_variables # => ["@my_ivar"]

# Variables that should be the same across all instances are called class variables (static variables in Java)
# They begin with @@, 
@@my_class_var = 'hi'
self.class.class_variables # => ["@@my_class_var"]

# You instantiate (create a new instance) a class with the new method
Array.new  # => []
String.new # => ""


# =====  Initializing An Object  =====
# When the new method is invoked, the class creates the new variable, and calls the method "initialize"
# You can then define how the instance is initialized by overriding this method. Any arguments you pass to the new method
# will be passed in to the instance's initialize method
class Person
  def initialize(name,age)
    @name = name
    @age  = age
  end
end
josh = Person.new 'Josh Cheek' , 27
josh  # => #<Person:0x1001862c0 @name="Josh Cheek", @age=27>


# =====  Setters and Getters  =====
# All variables are private, this means that you can't access them directly, you must create a method to return them
begin
  josh.name # => 
rescue => e
  e # => #<NoMethodError: undefined method `name' for #<Person:0x1001862c0 @name="Josh Cheek", @age=27>>
end

class Person
  def name
    return @name
  end
end
josh.name # => "Josh Cheek"


# Whoops, my full name is "Joshua Jay Cheek", we need to change that instance variable, but instance variabels are private
# We can create a "setter" method (Absolute Java would call this a "mutator")
class Person
  def name=(new_name)
    @name = new_name
  end
end
josh.name = "Joshua Jay Cheek"
josh.name # => "Joshua Jay Cheek"

# The Ruby interpreter knows that josh.name = 'Joshua Jay Cheek' should be invoking the method name= 
# and passing the argument 'Joshua Jay Cheek'


# That pattern is pretty common, a variable, with a setter and getter named after it. It is so common that Ruby gives you some
# black magic to make it easier. When you are defining a class's instance methods, you can say attr_accessor :method_name
# and it will create the setter and getter for you
Person.instance_methods(false) # => ["name=", "name"]
class Person
  attr_accessor :age
end
Person.instance_methods(false) # => ["name=", "name", "age=", "age"]
josh.age = 28
josh                           # => #<Person:0x1001862c0 @name="Joshua Jay Cheek", @age=28>

# COMPLETE CHALLENGE 10


# =====  Example of Difference Between Instance Variables and Class Variables  =====
# Lets say we wanted to know what planet people are from. Well, that information is the same across every instance of Person
# so we can keep it in a class variable
class Person
  @@planet = 'Earth'
  def planet
    return @@planet
  end
end
kate = Person.new 'Kate Beckinsale' , 36
kate.planet # => "Earth"
josh.planet # => "Earth"
kate.age    # => 36
josh.age    # => 28

Person.class_variables # => ["@@planet", "@@my_class_var"]
josh.instance_variables # => ["@name", "@age"]