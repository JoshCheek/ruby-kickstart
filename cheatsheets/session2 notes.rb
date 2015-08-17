#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/01-a-quick-word-about-blocks.rb file content is listed below
###############################################################################

# We'll talk about blocks more later, but for now just know
# that you declare a parameter in pipes (this is just
# like a method declaring parameters)

def mah_method!(method_param)
end


# This is the syntax for single line blocks
# note that you need parens around that 1,
# we'll discuss why later
mah_method!(1) { |block_parameter| block_parameter * 2 }


# you also have multiline syntax
# here you don't need parens around the 1
mah_method! 1 do |param1, param2|
  param1 + param2
end


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/02-arrays.rb file content is listed below
###############################################################################

# Arrays are ordered lists of objects.
array = ['zero', 'one', 'two']


# You access a given element by its index,
# beginning at zero
array[0] # => "zero"
array[1] # => "one"
array[2] # => "two"


# If you go past the end, you get back nil
array[3] # => nil


# Negative indexes backwards from the end
array[-1] # => "two"
array[-2] # => "one"
array[-3] # => "zero"


# Arrays know where the elements at their indexes are this
# means it is just as cheap to look up an element really
# deep as it is for an element right at the beginning.
array = (0...5000).to_a # the numbers 1 to 5k


# about half a second to access element at index 2500
start_time = Time.now
5_000_000.times { array[2500] }
Time.now - start_time # => 0.545612


# about half a second to access element at index 0
start_time = Time.now
5_000_000.times { array[0] }
Time.now - start_time # => 0.545922

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/03-array-iterating.rb file content is listed below
###############################################################################

numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# Use each to iterate, and pass a block
# We'll cover blocks more later
sum = 0
numbers.each { |number| sum += number }
sum # => 45


# Use map to make a new array out of the elements 
# returned by the block
squares = numbers.map { |number| number * number }
squares # => [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
numbers # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]


# iterate over the array two at a time
result = []
numbers.each_slice(2) { |a, b| result << [a, b] }
result # => [[0, 1], [2, 3], [4, 5], [6, 7], [8, 9]]


# iterate over the array in groups of two
# hitting each group as we go
result = []
numbers[0..5].each_cons(2) { |a, b| result << [a, b] }
result # => [[0, 1], [1, 2], [2, 3], [3, 4], [4, 5]]

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/04-array-filtering.rb file content is listed below
###############################################################################

numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]


# Use select to make a new array of only the elements
# you want if the block returns a truthy value then
# that element will be in the result.
evens = numbers.select { |number| number.even? }
evens   # => [0, 2, 4, 6, 8]


# Reject is the opposite
odds = numbers.reject { |number| number.even? }
odds    # => [1, 3, 5, 7, 9]


# None of these modify the original array
# They all return new arrays
numbers # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/05-other-useful-array-methods.rb file content is listed below
###############################################################################

chars = ['a', 'b', 'c']


# Concatenate with +
chars + ['d', 'e'] # => ["a", "b", "c", "d", "e"]


# Append to an array
chars # => ["a", "b", "c"]
chars << 'd'
chars # => ["a", "b", "c", "d"]


# Replace
chars[1] = 'Bee'
chars # => ["a", "Bee", "c", "d"]


# Delete index
chars.delete_at 1
chars # => ["a", "c", "d"]


# Delete object
chars.delete 'c'
chars # => ["a", "d"]


# Insert
index = 1
chars.insert index, 'b' , 'c'
chars # => ["a", "b", "c", "d"]


# Sorting
['c', 'b', 'd', 'a'].sort # => ["a", "b", "c", "d"]

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/06-classes.rb file content is listed below
###############################################################################

# We've explained what an object is, data packaged
# together with methods. But how do we define
# what data our object should have, and how do we
# associate methods with that data?
#
# For that, we use classes :)


# Classes are containers for methods.
#
# When you have an object that uses those methods, we
# say it is an *instance* of that class.
#
# The instance keeps track of its class, then when you
# invoke a method on it, it finds the method by looking
# it up in the class.

# So, objects have methods, and those methods are
# defined in its class.

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/07-class-examples.rb file content is listed below
###############################################################################

# Here are some examples of classes:
String  # => String
Hash    # => Hash
Array   # => Array
Fixnum  # => Fixnum


# Here are some examples of instances of these classes
"abc".class     # => String
{1 => 2}.class  # => Hash
[1, 2, 3].class # => Array
123456789.class # => Fixnum

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/08-methods-go-in-classes.rb file content is listed below
###############################################################################

# When we say "abc".length, the length method
# is stored in the String class.
length = String.instance_method 'length'
length # => #<UnboundMethod: String#length>


# So if we want to make a new method on strings,
# we would put it in the String class
class String
  def half_length
    length / 2
  end
end
"abcdef".half_length # => 3

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/09-class-questions.rb file content is listed below
###############################################################################

# Between Yankees and Baseball team
# which is a class and which is an instance?

# Between Person and Enoch
# which is a class and which is an instance?

# Can you think of another class and several instances?



# Are classes objects?
# If no, where do you think their methods are stored?
# If yes, what class are they instances of?

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/10-instance-variables.rb file content is listed below
###############################################################################

# Objects store their state in instance variables
# Those are the ones that begin with the @asperand

# Before, we said methods are their own little world.
# That was a lie, they can see instance variables.
# We'll talk more about that in a bit.
class Car
  # we call methods like this a "setter"
  def set_miles(miles)
    @miles = miles
  end

  # we call methods like this a "getter"
  def get_miles
    @miles
  end
end

car = Car.new
car.set_miles 1000
car.get_miles # => 1000

car.instance_variables              # => [:@miles]
car.instance_variable_get '@miles'  # => 1000


# Question: We create our car by calling Car.new
# where is the new method defined?

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/11-naming-methods.rb file content is listed below
###############################################################################

# Using set_whatever and get_whatever is kind of
# distracting. It's better to name your setters
# and getters the same as the variable they represent.

class Car
  def miles=(miles)
    @miles = miles
  end

  def miles
    @miles
  end
end

Car.instance_methods false # => [:miles=, :miles]

car = Car.new
car.miles = 1000  # Ruby knows this is the miles= method
car.miles         # => 1000

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/12-attr_accessor.rb file content is listed below
###############################################################################

# In fact, this naming convention for setters and
# getters is so common that there is a method that
# will write them for you.

class Car
  attr_accessor 'miles'
end

Car.instance_methods false # => [:miles, :miles=]

car = Car.new
car.miles = 1000
car.miles # => 1000

car.instance_variables              # => [:@miles]
car.instance_variable_get '@miles'  # => 1000


# attr_accessor is an example of metaprogramming, 
# You can write methods yourself like attr_accessor

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/13-initializing.rb file content is listed below
###############################################################################

# When you instantiate an object (make an instance
# of a class), you use the new method. After doing all
# the things necessary to make an object, the new method
# will invoke a method named initialize, and pass it
# any arguments you passed to new. This allows you to
# put your object into an initial state.

class Instrument
  def initialize(name, price)
    @name = name
    @price = price
  end

  attr_accessor 'name', 'price'
end

clarinet = Instrument.new 'Clarinet', 250
clarinet.name   # => "Clarinet"
clarinet.price  # => 250

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/14-self.rb file content is listed below
###############################################################################

# At any given time in Ruby, you are in the context
# of some object. Right now we're in the main object.

# You can see what object you're in by looking at self.
self # => main

class String
  self # => String
end

class String
  def existential
    self # => "abc"
  end
end
"abc".existential


# For a given context, you can always see your instance
# variables and your methods.

class Example
  self # => Example

  @abc = 123
  @abc # => 123

  # These will all work, because they all invoke new on
  # Example. Explicitly in the first two cases, implicitly
  # in the third.
  Example.new # => #<Example:0x00000100863818>
  self.new    # => #<Example:0x000001008634f8>
  new         # => #<Example:0x000001008631d8>
end


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/15-more-on-method-scope.rb file content is listed below
###############################################################################

# So methods being their own little world is totally a lie
# They can actually see instance variables and methods
# on their object.

class Example
  
  def method1
    self # => #<Example:0x00000100868f98>
    @var = 123
    method2 
    @var # => 500
  end
  
  def method2
    self # => #<Example:0x00000100868f98 @var=123>
    @var # => 123
    @var = 500
  end
  
end

Example.new.method1

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/16-THIS-IS-GONNA-TRIP-YOU-UP.rb file content is listed below
###############################################################################

# When calling a setter method, always use an explicit
# receiver. Otherwise it looks like you're setting a
# local variable.

class Flight
  attr_accessor 'arrival_time'

  def reset
    arrival_time      # => 1100
    arrival_time = 0

    # Wait, wtf is this?
    arrival_time      # => 0
    self.arrival_time # => 1100

    # Oh, it thought we wanted to make a local variable
    # named arrival_time
    local_variables   # => [:arrival_time]

    # We should have made it explicit by specifying that
    # arrival_time= is a method on self
    self.arrival_time = 0
  end
end

f = Flight.new
f.arrival_time = 1100
f.reset

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/17-singleton-classes.rb file content is listed below
###############################################################################

# Turns out that every object actually has 2 classes!
# The one we've been using so far, and its singleton 
# class -- a class whose only instance is the object.

# So an object is defined by its class, but it also
# can have its own unique behaviour by defining
# methods on its singleton class.


# Singleton classes don't have names
obj = Object.new
obj.singleton_class # => #<Class:#<Object:0x00000100866ab8>>

# You can access the singleton class like this
class << obj
  def greet
    'Howdy, partner.'
  end
end
obj.singleton_class.instance_methods false # => [:greet]
obj.singleton_methods # => [:greet]
obj.greet # => "Howdy, partner."


# Shortcut syntax for the above
def obj.about
  "A plain old object with a few tricks."
end

obj.about # => "A plain old object with a few tricks."
obj.singleton_methods # => [:greet, :about]

# Question: if everything is an object, and every object
#   has a singleton class, then do singleton classes have
#   singleton classes?
# 
#   How can you test your answer out?

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/18-class-instance-variables.rb file content is listed below
###############################################################################

# Lets say we wanted to know what planet people are from.
# Well, that information is the same across every person
# so we can keep it in an instance variable on the class.

class Person
  # When we define methods here, they get defined for
  # instances of Person, so we need to either store
  # them in Person's class or singleton class. It doesn't
  # make sense to give EVERY class a home_planet, so
  # lets put it on the singleton_class
  self # => Person
  class << self
    attr_accessor 'home_planet'
  end

  # remember, self is Person, so @home_planet
  # is defined on the Person class itself
  @home_planet = 'Erth'
  Person.home_planet  # => "Erth"
  Person.home_planet = 'Earth'
  @home_planet        # => "Earth"


  attr_accessor 'name'
  def initialize(name)
    # self is now an instance of person, so @name
    # is defined for this particular person
    @name = name
  end

  # This one is for instances
  def home_planet
    Person.home_planet
  end
end

Person.home_planet
kate = Person.new 'Kate Beckinsale'
josh = Person.new 'Josh Cheek'
kate.home_planet  # => "Earth"
josh.home_planet  # => "Earth"
kate.name         # => "Kate Beckinsale"
josh.name         # => "Josh Cheek"

Person.instance_variables # => [:@home_planet]
josh.instance_variables   # => [:@name]

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session2/notes/19-last-words.rb file content is listed below
###############################################################################

# Okay, ready for challenges ^_^
# I spent a long time on these, hopefully you'll enjoy them!



# A USEFUL HINT!
# You can return from a method early with the keyword return
def method(condition)
  return 1 if condition
  2
end
method true  # => 1
method false # => 2

# Check out cheatsheet for arrays:
# https://github.com/JoshCheek/ruby-kickstart/blob/master/cheatsheets/arrays.rb
################################## -- END -- ##################################



