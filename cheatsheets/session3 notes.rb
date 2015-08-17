#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/01-symbols-introduction.rb file content is listed below
###############################################################################

# Symbols look like this:
:this_is_a_symbol       # => :this_is_a_symbol
:this_is_a_symbol.class # => Symbol


# Symbols are Strings that are immutable, meaning they can never
# change, like numbers. They are never garbage collected, so if
# you use one, it will last until your program ends.


# They are most commonly used as hash keys, because their hash
# value can be cached, making them as efficient as a number for
# this purpose. They are also used frequently in place of enum types,
# and used internally in Ruby to refer to things like method names.


# For example, it is common to declare attr_accessor with a symbol.
# And instance_methods returns back symbols representing the methods,
# because that's what Ruby uses internally.
class Example
  instance_methods(false) # => []
  attr_accessor :my_method
  instance_methods(false) # => [:my_method, :my_method=]
end

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/02-symbols-always-the-same.rb file content is listed below
###############################################################################

# Every instance of the symbol is the same object,
# notice they have the same object id.
:this_is_a_symbol.object_id # => 212668
:this_is_a_symbol.object_id # => 212668

# Whereas each String is a new object,
# notice they have different object ids.
'this is a string'.object_id # => 2149403240
'this is a string'.object_id # => 2149402020


# This makes them easy to test equality. For a symbol you just check
# if it is the same object, but for a String, you must check that
# each character is the same character (iterate through the entire
# string) this gives symbols a performance boost for checking
# equality.


# you typically use symbols in a situation where you wish to use
# a constant, but want it to be named, like a String

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/03-hash-introduction.rb file content is listed below
###############################################################################

# A hash table is a data structure that allows you to keep track of
# data in key / value pairs.
#
# Where arrays access elements by their index, hashes access
# elements by their keys, and a key can be any object.
#
# Hashes are very fast, with near constant time to look up an element.

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/04-hash-literals.rb file content is listed below
###############################################################################

# Where Arrays are represented with brackets,
# Hashes are represented in curly braces
[].class # => Array
{}.class # => Hash


# Keys are separated from their values with a hash rocket =>
# with the key on the left, and the value on the right
{0 => 'first', 1 => 'second'}  # => {0=>"first", 1=>"second"}

key   = :one
value = "two"
{key => value} # => {:one=>"two"}

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/05-hash-setting-and-getting.rb file content is listed below
###############################################################################

# You can set elements into a hash table with hash[key] = value
hash = {}
hash[:number] = 12
hash[:colour] = 'black'
hash                      # => {:number=>12, :colour=>"black"}


# You can get them back out with hash[key]
hash[:number]             # => 12
hash[:colour]             # => "black"


# You can change its value by setting it again
hash[:colour]             # => "black"
hash[:colour] = :black
hash[:colour]             # => :black


# If you access a nonexistent element, nil is returned
hash[:yay_for_pirates!]   # => nil


# If it makes more sense for your hash, you can change
# what it returns for nonexistent keys by passing it
# a block that will be invoked when a mising key is requested.
character_counts = Hash.new { |this_hash, key| this_hash[key] = 0 }
character_counts["a"]     # => 0
character_counts          # => {"a"=>0}

"abcbcbababcbcx".each_char do |char|
  character_counts[char] += 1
end

character_counts # => {"a"=>3, "b"=>6, "c"=>4, "x"=>1}

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/06-hash-keys.rb file content is listed below
###############################################################################

# Symbols are commonly used as keys because of their efficiency,
# but you can use any object you like.

hash          = Hash.new
hash[0]       = 'zero'
hash['nine']  = 9
hash[/regex/] = ['array', 'of', 'strings']
hash  # => {0=>"zero", "nine"=>9, /regex/=>["array", "of", "strings"]}


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/07-hash-iterating.rb file content is listed below
###############################################################################

# in 1.8, HASHES ARE NOT ORDERED, if you iterate through them,
# you don't know what order they will be passed
# in 1.9, they will passed to your block in the order they were inserted.


# When you iterate over the hash, you pass it a block, just like
# arrays. But this block takes two arguments, the key and value
student_ids = {'Bill' => 25, 'Danya' => 15, 'Mei' => 12}

student_ids.each do |student, id|
  puts "#{student}'s student id is #{id}"
end
# >> Bill's student id is 25
# >> Danya's student id is 15
# >> Mei's student id is 12

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/08-proc-introduction.rb file content is listed below
###############################################################################

# A Proc is just a way of storing code in an object
# It's just like a method in that it takes parameters, evaluates
# code, and then returns a result.
square_it_proc = Proc.new { |num| num * num }


# Its parameters are given in the pipes, so the above |num| is
# the parameter that the proc receives.


# You tell it to execute with the call method
square_it_proc.call 5  # => 25
square_it_proc.call 10 # => 100


# Compare it to a method
def square_it_method(num)
  num * num
end
square_it_method 5    # => 25
square_it_method 10   # => 100

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/09-procs-can-see-their-environment.rb file content is listed below
###############################################################################

# Unlike methods, procs can see the environment they're defined in.
count = 0
incrementer = Proc.new { count += 1 }

count                         # => 0
incrementer.call
count                         # => 1
incrementer.call
count                         # => 2


# They keep the environment they were defined in
# even if they get passed into a new scope.
def invoke_10_times(proc)
  10.times { proc.call }
end

count                         # => 2
invoke_10_times incrementer
count                         # => 12

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/10-blocks-introduction.rb file content is listed below
###############################################################################

# Blocks are what we call a proc when we pass it into a method.
# They are defined with "{ }" or "do end"
ary = [3,2,1]               # => [3, 2, 1]

ary.map! { |num| num * 2 }
ary                         # => [6, 4, 2]

ary.map! do |num|
  num * 2
end
ary                         # => [12, 8, 4]


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/11-block-params-and-return.rb file content is listed below
###############################################################################

# Methods will raise an error if you give them the wrong number
# of arguments. But blocks will not.
[1,2,3].map { 0 } # => [0, 0, 0]


# A return statement in a method will from return it. But a return
# statement in a proc will return from the enclosing environment.
def first_even(nums)
  nums.each do |num|
    return num if num.even?
  end
  nil
end
first_even [1,5,7,4,19,8] # => 4

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/12-all-methods-take-blocks.rb file content is listed below
###############################################################################

# When you pass a block as a parameter, the block gets put into
# a special slot that every method has, whether they use the
# block or not.
def method
  "result"
end
method {} # => "result"
method    # => "result"


# To access the block, use the ampersand, this will
# give it to you as a proc that you can use.
def method2(&block)
  block.call.upcase
end
method2 { 'from the block' } # => "FROM THE BLOCK"


# If you didn't pass a block, it will be set to nil.
def method3(&block)
  if block
    "The block evaluates to #{block.call}"
  else
    "No block."
  end
end
method3 { ":)" }  # => "The block evaluates to :)"
method3           # => "No block."


# Like with any proc, you can pass arguments to it
def heres_six(&block)
  block.call 6
end
result = heres_six { |num| "#{num*2} is Josh's favourite number"}
result # => "12 is Josh's favourite number"


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/13-difference-between-block-syntaxes.rb file content is listed below
###############################################################################

def block_checker(array, &block)
  [array.to_a, !!block]
end

# { ... } blocks bind to the method immediately to their left.
# do ... end blocks will bind to the furthest left method.

# The block is passed to map
block_checker [1,2,3].map   { 1 }    # => [[1, 1, 1], false]

# The block is passed to block_checker
block_checker([1,2,3].map) { 1 }     # => [[1, 2, 3], true]

# The block is passed to block_checker
block_checker [1,2,3].map do 1 end   # => [[1, 2, 3], true]


# This makes { ... } ideal for inline blocks, and
# do ... end ideal for mutli line blocks

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/14-storing-blocks-for-later.rb file content is listed below
###############################################################################

# Now that we know to use &block, we can do cool things like
# Store the block for later.
class CollegeStudent

  attr_accessor :do_when_twenty_one

  def initialize(age, &block)
    @age = age
    @do_when_twenty_one = block
  end

  def birthday!
    @age += 1
    return "#{@age}: study :(" unless @age == 21
    do_when_twenty_one.call @age
  end

end


pam = CollegeStudent.new 18 do |age|
  "#{age}: GET SAUCED!"
end

pam.birthday! # => "19: study :("
pam.birthday! # => "20: study :("
pam.birthday! # => "21: GET SAUCED!"
pam.birthday! # => "22: study :("
pam.birthday! # => "23: study :("

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/15-forwarding-blocks.rb file content is listed below
###############################################################################

# Another common thing is to forward blocks to other methods
def meth1(&block)
  "(meth1: #{block.call})"
end


# Use the & notation when calling a method to put a block into
# the method's block slot.
def meth2(&block)
  "#{meth1(&block)} (meth2: #{block.call})"
end

counter = 0
meth2 { counter += 10 } # => "(meth1: 10) (meth2: 20)"

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/16-optional-params.rb file content is listed below
###############################################################################

# You have already seen ordinal parameters, they have a name and
# are mandatory. But you can make them optional by giving them
# an equal sign, and listing a default value.
def same_case(str, upcase = true)
  return str.upcase if upcase
  str.downcase
end

same_case 'UPPER lower'          # => "UPPER LOWER"
same_case 'UPPER lower' , false  # => "upper lower"


# optional parameters must go to the right of ordinal parameters,
# and are filled in from the left
def what_are_filled_in(a=5, b=4, c=3, d=2, e=1)
  "#{a} #{b} #{c} #{d} #{e}"
end

what_are_filled_in                         # => "5 4 3 2 1"
what_are_filled_in :A                      # => "A 4 3 2 1"
what_are_filled_in :A , :B                 # => "A B 3 2 1"
what_are_filled_in :A , :B , :C            # => "A B C 2 1"
what_are_filled_in :A , :B , :C , :D       # => "A B C D 1"
what_are_filled_in :A , :B , :C , :D , :E  # => "A B C D E"

# what will this return?
what_are_filled_in :A ,                :E  # =>

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/17-variable-lengthed-params.rb file content is listed below
###############################################################################

# After listing your ordinal and optional parameters, you can take
# a variable length of arguments. To do this, you use '*' before
# the parameter. In Ruby 1.8, it must be the last parameter.
# The parameters that match it will be put into an array.
def variable_length(first, second=:default, *rest)
  [first, second, rest]
end
variable_length 1           # => [1, :default, []]
variable_length 1, 2        # => [1, 2, []]
variable_length 1, 2, 3     # => [1, 2, [3]]
variable_length 1, 2, 3, 4  # => [1, 2, [3, 4]]


# how might we use it?
def minimum( *numbers )
  min = numbers.first
  numbers.each { |number| min = number if number < min }
  min
end

minimum 2, 1             # => 1
minimum 2, 1, 5, -3, 16  # => -3


# In the same way that we can use & to take a block out of
# the block slot or put it back in, we can use * to take a
# variable number of arguments out, or put them back in.
ruby_kickstart_favourite_numbers = [12, 13, 3, 43, 7]
minimum(  12, 13, 3, 43, 7 )                 # => 3
minimum(*[12, 13, 3, 43, 7])                 # => 3
minimum(*ruby_kickstart_favourite_numbers )  # => 3

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/18-hash-params.rb file content is listed below
###############################################################################

# If we wanted to pass a bunch of options to a method,
# we might use a hash table.
def same_case( str , options = Hash.new )
  return str.upcase if options[:upcase]
  return str.upcase if options[:downcase] == false
  str.downcase
end

same_case 'UPPER lower'                         # => "upper lower"
same_case 'UPPER lower', { :upcase   => false } # => "upper lower"
same_case 'UPPER lower', { :downcase => true  } # => "upper lower"
same_case 'UPPER lower', { :downcase => false } # => "UPPER LOWER"
same_case 'UPPER lower', { :upcase   => true  } # => "UPPER LOWER"


# The problem is that this looks an awful lot like a block.
# But this is such a common use case that syntactic sugar was added.
# You can now place hash arguments at the end of your regular list,
# and they will be collected into the last argument
same_case 'UPPER lower'                       # => "upper lower"
same_case 'UPPER lower' , :upcase   => false  # => "upper lower"
same_case 'UPPER lower' , :downcase => true   # => "upper lower"
same_case 'UPPER lower' , :downcase => false  # => "UPPER LOWER"
same_case 'UPPER lower' , :upcase   => true   # => "UPPER LOWER"

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/19-putting-it-all-together.rb file content is listed below
###############################################################################

# We've seen a lot of things we can do with method parameters.
# But how do they all work together?
def meth(ordinal, optional=true, *variable_length, &block)
end

# Probably you don't need to use them all in one method like this,
# it is up to you to find the right fit for your use case :).

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session3/notes/20-last-words.rb file content is listed below
###############################################################################

# Check out the cheatsheet for Hashes
# https://github.com/JoshCheek/ruby-kickstart/blob/master/cheatsheets/hashes.rb
#
# The material we went over in this section covers almost everything
# else that I think you should know about the topics, so I'm not going
# to bother with any cheatsheet this time.
#
# But if you want to see the docs, they're at
# http://ruby-doc.org/core/classes/Symbol.html
# http://ruby-doc.org/core/classes/Hash.html
# http://ruby-doc.org/core/classes/Proc.html

################################## -- END -- ##################################



