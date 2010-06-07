# http://ruby-doc.org/core/classes/Proc.html
# you might also check the notes from ch3 for of an explanation of what a block / proc is

# =====  Initializing A Proc  =====
# the differences are subtle, and I'm not even sure completely any more
# I usually go with proc or lambda, if it isn't behaving the way you like
# try switching them out.
Proc.new { |param1,*params,&block| 'code goes here' } # => #<Proc:0x000000010019cae8@-:7>
proc     { |param1,*params,&block| 'code goes here' } # => #<Proc:0x000000010019b8a0@-:8>
lambda   { |param1,*params,&block| 'code goes here' } # => #<Proc:0x000000010019a608@-:9>

# =====  Invoking a Proc  =====

month = proc do |month_number| 
  %w(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)[ month_number-1 ]
end
month.call 1  # => "Jan"
month.call 2  # => "Feb"
month[3]      # => "Mar"
month[4]      # => "Apr"


# =====  Receiving a Block in a Method  =====
# place an ampersand in front of the block variable
# it will convert the block into a proc so that you can manipulate it as a variable
# in this case, it then returns the proc
def proc_receiver( foo , &bar )
  bar
end

# did not pass a block, so bar variable is nil
proc_receiver('')                               # => nil

# passed a block, bar points to its proc, and returns it to us
result = proc_receiver('') { |num| num * 100 }  # => #<Proc:0x00000001001931f0@-:34>
result[3]                                       # => 300
result.call 9                                   # => 900



# if you don't intend to do anything more than call the block, then you can use
# block_given? to see if a block was submitted to the method
# and yield to invoke that block
# think of them as private methods only visible within the scope of the method you are using them in

def block_receiver( foo )
  if block_given?
    yield 5 # calls the block and passes 5 into it
  else
    'no block'
  end
end
block_receiver('')                        # => "no block"
block_receiver('') { |num| num * 100 }    # => 500


# =====  Binding  =====
# blocks and procs bind to the environment that they are defined in
# other than that, and some fudgy arity rules, they are exactly the same as methods
# it means that you can access elements from the surrounding environment
x = 'outside'
[1,2,3].map { x } # => ["outside", "outside", "outside"]


# =====  Putting a Block / Proc / Method into a Block Slot  =====
def happy()  'happy! happy! happy!'  end
def sad()    'saaaaaaaad :('         end

def i_feel
  return "I don't know how I feel :/" unless block_given?
  "I feel #{yield} today."
end

# no block in the block slot
i_feel                                  # => "I don't know how I feel :/"

# custom block in the block slot
i_feel { 'mediocre' }                   # => "I feel mediocre today."

# place a proc into the block slot
troublemaker = proc { 'mischievous' }   # => #<Proc:0x00000001001897b8@-:80>
i_feel(&troublemaker)                   # => "I feel mischievous today."

# a method into the block slot
meth = method :happy                    # => #<Method: Object#happy>
i_feel(&meth)                           # => "I feel happy! happy! happy! today."
i_feel(&method(:sad))                   # => "I feel saaaaaaaad :( today."


# =====  The Ampersand =====
# In this context, the ampersand is a unary operator that applies to the object on its right
# It invokes the to_proc method on that object in order to get back a proc
# In Ruby 1.8, It is basically Procs and Methods that have to_proc
# In 1.9, they added a to_proc to the Symbol class
# Lets do the same thing for the String class, then we can pass a String in,
# have it be converted to a proc, and placed into the block slot of the method.

class String
  def to_proc
    proc do |object|
      # send is a method that receives a string or symbol,
      # and invokes the method the string or symbol has named
      # in this case, we are passing ourself, so we invoke ourself on the object
      object.send self
    end
  end
end

# first create a proc that receives an object, and invokes the upcase method on it
upcasser = "upcase".to_proc
upcasser['Hello, world!']  # => "HELLO, WORLD!"

# Array iterators take blocks, and pass the element from the Array to the block
# lets use our new Symbol#to_proc
%w(rise up with fists).map(&'upcase')                         # => ["RISE", "UP", "WITH", "FISTS"]

# for comparison, some longhand versions:
%w(rise up with fists).map { |object| object.send 'upcase' }  # => ["RISE", "UP", "WITH", "FISTS"]
%w(rise up with fists).map { |str| str.upcase }               # => ["RISE", "UP", "WITH", "FISTS"]

# a few more examples
%w(rise up with fists).map(&'reverse')  # => ["esir", "pu", "htiw", "stsif"]
[1,4,3,-24].map(&'to_f').map(&'abs')    # => [1.0, 4.0, 3.0, 24.0]
Array.new( 5 , &'to_s' )                # => ["0", "1", "2", "3", "4"]

class Integer
  # note that this method already exists in 1.8.7+ 
  def even? # !> method redefined; discarding old even?
    self % 2 == 0
  end
end
[1,2,3,4,5,6,7,8,9].select(&'even?') # => [2, 4, 6, 8]
[1,2,3,4,5,6,7,8,9].reject(&'even?') # => [1, 3, 5, 7, 9]

# In 1.9, this behaviour exists by default, in the Symbol class 
# (you don't have to create it like we did here)
# But keep in mind, that & will pull a proc out of any object that has a to_proc method
# You don't necessarily have to go defining to_proc all over the place,
# methods (which, remember, are objects) already have a to_proc method defined on them
# and your own classes have methods
class Person
  attr_accessor :name
  def initialize(name) 
    @name = name 
  end
end
%w(Jill Jim Josh).map(&Person.method(:new)) # => [#<Person:0x1001600c0 @name="Jill">, #<Person:0x100160070 @name="Jim">, #<Person:0x100160020 @name="Josh">]


class Person
  
  def visit(location)
    @visited ||= Array.new  # semantically equivalent to:  @visited = @visited || Array.new
    @visited << location
  end
  
  def visited
    @visited
  end
  
end
sam = Person.new 'Samantha'      # => #<Person:0x10015f4e0 @name="Samantha">
%w(Paris New\ York Sydney).each(&sam.method(:visit))
sam                              # => #<Person:0x10015f4e0 @name="Samantha", @visited=["Paris", "New York", "Sydney"]>
