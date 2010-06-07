# =====  Symbols  =====
# Symbols look like this:
:this_is_a_symbol       # => :this_is_a_symbol
:this_is_a_symbol.class # => Symbol

# Symbols are Strings that are immutable
# they are never garbage collected
# they are very efficient for certain purposes because results of operations on them
# can be cached, and recalled at a later point in time (since they cannot be changed)
# they are most commonly used as hash keys, because their hash value can be cached, making them
# as efficient as a number for this purpose. They are also used frequently in place of enum types,
# and used internally in Ruby to refer to things like method names
# for example, it is common to declare attr_accessor with a symbol
class Example
  instance_methods(false) # => []
  attr_accessor :my_method
  instance_methods(false) # => ["my_method", "my_method="]
end

# every instance of the symbol is the same object, notice they have the same object id
:this_is_a_symbol.object_id # => 212668
:this_is_a_symbol.object_id # => 212668

# whereas each String is a new object, notice they have different object ids
'this is a string'.object_id # => 2149403240
'this is a string'.object_id # => 2149402020

# this makes them easy to test equality, for a symbol you just check if it is the same object
# for a String, you must check that each character is the same character (iterate through the entire string)
# this gives symbols a performance boost for checking equality

# you typically use symbols in a situation where you wish to use a constant, but want it to be named, like a String


# =====  Hashes  =====
# A hash table is a data structure that allows you to keep track of data in key / value pairs
# The way PHP defines arrays, they are actually hash tables, this allows you to name your keys.
#
# In an array, you would access an element based on it's index, but in a hash, you access an element
# based on it's key. If those keys are consecutive non negative integers, then it will feel like an Array
# but it is implemented differently inside.
#
# Hashes are very fast, with near constant time to look up an element.
#
# Where Arrays are represented with brackets, Hashes are represented in curly braces
%w(first second third)                            # => ["first", "second", "third"]
{ 0 => 'first' , 1 => 'second' , 2 => 'third' }   # => {0=>"first", 1=>"second", 2=>"third"}

# Keys are separated from their values with a hash rocket => with the key on the left, and the value on the right
hash = Hash.new
hash[:number] = 12
hash[:colour] = 'black'
hash                      # => {:number=>12, :colour=>"black"}
hash[:number]             # => 12
hash[:colour]             # => "black"

# symbols are commonly used as keys because of their efficiency, but you can use any object you like, including your own objects

class Person
  def initialize(name)
    @name = name
  end
end

josh = Person.new "Josh"

hash[0]        =  'zero'
hash['nine']   =  9
hash[josh]     =  'ruby'
hash[/regex/]  =  %w(array of strings)
hash                      # => {0=>"zero", :number=>12, :colour=>"black", /regex/=>["array", "of", "strings"], "nine"=>9, #<Person:0x1003a4d18 @name="Josh">=>"ruby"}

# you can change a value by changing it's key
hash[:number]             # => 12
hash[:number] = 13        # => 13

# in 1.8, HASHES ARE NOT ORDERED, if you iterate through them, you don't know what order they will be passed
# in 1.9, hashes are ordered according to their insertion order

# you can create a hash by giving a list of key value pairs
{ :number => 12 , :colour => 'black' } # => {:number=>12, :colour=>"black"}

# hashes return nil if the key does not exist
hash['kevin'] # => nil


# check out example 1


# =====  Blocks  =====
# When you call some methods, you pass a block of code, for example iterating through an array
# There are two syntaxes for blocks
# Curly Braces and do end
ary = [3,2,1]

ary.map! { |num| num * 2 } # => [6, 4, 2]

ary.map! do |num|
  num * 2
end

ary # => [12, 8, 4]


def block_checker(param) 
  [ param , block_given? ]
end

# their only difference is prescidence, a curly brace will bind to the method invocation immediately to its left
# in this case, the block is a param to the map method, not the block_checker method
block_checker [1,2,3].map    { |i| i * 2 }            # => [[2, 4, 6], false]
block_checker( [1,2,3].map ) { |i| i * 2 }            # => [[1, 2, 3], true]


# and a do ... end block will map to the furthest left method invocation
# in this case, the block is a param to the block_checker method, not the reverse method
block_checker [1,2,3].map do |i| i * 2 end     # => [[1, 2, 3], true]



# You can think of a block the same as a method
# whatever it receives in pipes are its parameters
# whatever its last line is, is what it returns
def times_two(num)
  num * 2
end

ary.map do |num|
  num * 2
end

# there are two big differences between blocks and methods:
# 1. A block doesn't have a name, instead it is stored in a special parameter slot that can be invoked
# 2. A block is able to see its containing scope
my_favourite_number = 12
ary                             # => [12, 8, 4]
ary.map { my_favourite_number } # => [12, 12, 12]

# But a method can't see its containing scope
def as_method
  my_favourite_number
end

begin
  as_method
rescue => e
  e # => #<NameError: undefined local variable or method `my_favourite_number' for main:Object>
end


# When inside of a method, you can check to see if a block was passed to it by using block_given?
def block_checker # !> method redefined; discarding old block_checker
  block_given?
end
block_checker     # => false
block_checker { } # => true

# You can also call the block by saying yield
def block_caller
  if block_given?
    result_of_block = yield
    return result_of_block
  else
    return 'no block'
  end
end

block_caller                            # => "no block"
block_caller { 'passed from block' }    # => "passed from block"

# You can also pass arguments to blocks
# 'passed from block_caller' is passed to the block
# the block receives it, converts it to upper case, and appends ' and modified by the block'
# since it is the last line, it is what the block returns
# so it is what yield (which invoked the block) returns, and stores in the variable result_of_block
# the block_caller method then returns result_of_block
def block_caller # !> method redefined; discarding old block_caller
  result_of_block = yield 'passed from block_caller'
  return result_of_block
end

block_caller { |str| str.upcase + ' and modified by the block' } # => "PASSED FROM BLOCK_CALLER and modified by the block"



# =====  Procs  =====
# procs are basically the same thing as blocks, but you have to explicitly create them
fav_number_proc = proc { my_favourite_number }
fav_number_proc         # => #<Proc:0x0000000100177c70@-:188>
fav_number_proc.call    # => 12
my_favourite_number     # => 12


# there are several different ways to create them, with sublte binding differences
# I have found that the proc method is the best, but you can also do
Proc.new { }  # => #<Proc:0x0000000000000000@-:196>
lambda { }    # => #<Proc:0x0000000000000000@-:197>
proc { }      # => #<Proc:0x0000000000000000@-:198>

# they are useful, because you can assign them to variables and pass them as arguments
# to use a block in that way, you can convert it to a proc (explained in example 2, but we'll get there later)



# =====  Optional Arguments (default values)  =====
# you have already seen ordinal arguments, they have a name and are mandatory
# but you can make them optional by giving them an equal sign, and listing a default value
def same_case( str , upcase = true )
  return str.upcase if upcase
  str.downcase
end

same_case 'UPPER lower'          # => "UPPER LOWER"
same_case 'UPPER lower' , false  # => "upper lower"


# optional arguments must go to the right of ordinal arguments, and are filled in from the left
def what_are_filled_in( a=5 , b=4 , c=3 , d=2 , e=1 )
  "#{a} #{b} #{c} #{d} #{e}"
end

what_are_filled_in                         # => "5 4 3 2 1"
what_are_filled_in :A                      # => "A 4 3 2 1"
what_are_filled_in :A , :B                 # => "A B 3 2 1"
what_are_filled_in :A , :B , :C            # => "A B C 2 1"
what_are_filled_in :A , :B , :C , :D       # => "A B C D 1"
what_are_filled_in :A , :B , :C , :D , :E  # => "A B C D E"

# what will this return?
what_are_filled_in :A ,                :E  #


# =====  Variable Length Arguments  =====
# you can take a variable length of arguments. To do this, you use '*' before the argument
# it must be the last param (in 1.8, but in 1.9 you can place other arguments after it, which is really fucking convenient)
def variable_length( *args )
  return args
end
variable_length :abc , :def , 'ghi' , /jkl/ , 1 , 2 # => [:abc, :def, "ghi", /jkl/, 1, 2]

# how might we use it?
def minimum( *numbers )
  min = numbers.first
  numbers.each { |number| min = number if number < min }
  min
end

minimum 2 , 1                 # => 1
minimum 2 , 1 , 5 , -3 , 16   # => -3

ruby_kickstart_favourite_numbers = [ 12 , 13 , 3 , 43 , 7 ]
minimum(    12 , 13 , 3 , 43 , 7   )          # => 3
minimum( *[ 12 , 13 , 3 , 43 , 7 ] )          # => 3
minimum( *ruby_kickstart_favourite_numbers )  # => 3

# =====  Hash Arguments  =====
# In example 1, we saw how we might pass a hash of arguments to an method but the syntax was really ugly.
# Fortunately, people like to do this enough that some syntactic sugar was added. 
# You can now place hash arguments at the end of your regular list, and they will be collected into the last argument

def same_case( str , options = Hash.new )
  return str.upcase   if options[:upcase] || options[:downcase] == false
  str.downcase
end
same_case 'UPPER lower'                       # => "upper lower"
same_case 'UPPER lower' , :upcase   => false  # => "upper lower"
same_case 'UPPER lower' , :downcase => true   # => "upper lower"
same_case 'UPPER lower' , :downcase => false  # => "UPPER LOWER"
same_case 'UPPER lower' , :upcase   => true   # => "UPPER LOWER"


# =====  Block Arguments  =====
# When a block is passed to an argument, it goes into a special spot just for it
# we can check if it is there with block_given? and we can invoke it with yield
# There are examples of this above
# 
# Or, we can convert it to a Proc, then it is in an object that we can pass around.
# To convert it to a proc, we use & on the last argument in the list. This is the one argument
# in 1.8 that can go after a variable length array
# see example 2



