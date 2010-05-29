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

# every instance of the symbol is the same object, notice they have the same object id
:this_is_a_symbol.object_id # => 212668
:this_is_a_symbol.object_id # => 212668

# whereas each String is a new object, notice they have different object ids
'this is a string'.object_id # => 2148258700
'this is a string'.object_id # => 2148257720

# this makes them easy to test equality, for a symbol you just check if it is the same object
# for a String, you must check that each character is the same character (iterate through the entire string)
# this gives symbols a performance boost for checking equality


# =====  Hashes  =====
# A hash table is a data structure that allows you to keep track of data in key / value pairs
# The way PHP defines arrays, they are actually hash tables, this allows you to name your keys.
# In an array, you would access an element based on it's index, but in a hash, you access an element
# based on it's key. If those keys are consecutive non negative integers, then it will feel like an Array
# but it is implemented differently inside.
#
# Hashes are very fast, with near constant time to look up an element.
#
# Where Arrays are represented with brackets, Hashes are represented in curly braces
# Keys are separated from their values with a hash rocket => with the key on the left, and the value on the right
hash = Hash.new
hash[:number] = 12
hash[:colour] = 'black'
hash                      # => {:number=>12, :colour=>"black"}
hash[:number]             # => 12
hash[:colour]             # => "black"

# symbols are commonly used as keys because of their efficiency, but you can use any object you like
hash[0]        =  'zero'
hash['nine']   =  9
hash[/regex/]  =  %w(array of strings)
hash                      # => {0=>"zero", /regex/=>["array", "of", "strings"], "nine"=>9, :number=>12, :colour=>"black"}

# you can change a value by changing it's key
hash[:number]             # => 12
hash[:number] = 13        # => 13

# in 1.8, HASHES ARE NOT ORDERED, if you iterate through them, you don't know what order they will be passed
# in 1.9, hashes are ordered according to their insertion order

# you can create a hash by giving a list of key value pairs
{ :number => 12 , :colour => 'black' } # => {:number=>12, :colour=>"black"}

# hashes return nil if the key does not exist
hash['josh'] # => nil


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

# You can think of a block the same as a method
# whatever it receives in pipes are its parameters
# whatever its last line is, is what it returns
def times_two(num)
  num * 2
end
ary.map do |num|
  num * 2
end

# there are two big differences:
# 1. A block doesn't have a name, instead it is stored in a variable that can be called
# 2. A block is able to see its containing scope
my_favourite_number = 12

ary.map { my_favourite_number } # => [12, 12, 12]

def as_method
  my_favourite_number
end

begin
  as_method
rescue => e
  e # => #<NameError: undefined local variable or method `my_favourite_number' for main:Object>
end

# When inside of a method, you can check to see if a block was passed to it by using block_given?
def block_checker
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
def block_caller # !> method redefined; discarding old block_caller
  result_of_block = yield 'passed from block_caller'
  return result_of_block
end

block_caller { |str| str.upcase + ' and modified by the block' } # => "PASSED FROM BLOCK_CALLER and modified by the block"



# =====  Procs  =====
# procs are basically the same thing as blocks, but you have to explicitly create them
fav_number_proc = proc { my_favourite_number }
fav_number_proc         # => #<Proc:0x0000000100181ab8@-:141>
fav_number_proc.call    # => 12

# there are several different ways to create them, with sublte binding differences
# I have found that the proc method is the best, but you can also do
Proc.new { }  # => #<Proc:0x0000000000000000@-:147>
lambda { }    # => #<Proc:0x0000000000000000@-:148>
proc { }      # => #<Proc:0x0000000000000000@-:149>

# they are useful, because you can assign them to variables and pass them as arguments
# to use a block in that way, you can convert it to a proc



# =====  Method Parameters  =====
# **********FILL ME OUT ******************

