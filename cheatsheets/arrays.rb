# =====  Initializing  =====
[ 1 , 2 , 3 ]                       # => [1, 2, 3]
Array.new(2)                        # => [nil, nil]
Array.new(5) { |i| i * 5 }          # => [0, 5, 10, 15, 20]
Array.new(2) { Array.new(2) }       # => [[nil, nil], [nil, nil]]
ary = [ ]                           # => []
ary = Array.new                     # => []
  # initializing an array of strings on whitespace
%w(this that, and the other)        # => ["this", "that,", "and", "the", "other"]


# =====  Accessing and assigning  =====
ary = %w(ruby python perl php javascript c)
ary[0]                # => "ruby"
ary[1]                # => "python"
ary[2]                # => "perl"
ary[3]                # => "php"
ary[4] = 'ecmascript'
ary                   # => ["ruby", "python", "perl", "php", "ecmascript", "c"]

  # negative indexes are applied from the end
ary[-1]               # => "c"
ary[-2]               # => "ecmascript"
ary[-3]               # => "php"

  # first and last (unfortunately can't do ary.first = 'abc' , for reasons that will become clearer when we talk more about the object model)
ary.first             # => "ruby"
ary.last              # => "c"


  # subarrays, give a range of indexes, or a start index and length
ary                   # => ["ruby", "python", "perl", "php", "ecmascript", "c"]
ary[0..2]             # => ["ruby", "python", "perl"]
ary[-3..-1]           # => ["php", "ecmascript", "c"]
ary[2,3]              # => ["perl", "php", "ecmascript"]

  # can replace a range of indexes with elements from an array (size doesn't need to match)
ary                   # => ["ruby", "python", "perl", "php", "ecmascript", "c"]
ary[1..2] = [9,8,7,6,5,4,3,2,1]
ary                   # => ["ruby", 9, 8, 7, 6, 5, 4, 3, 2, 1, "php", "ecmascript", "c"]


ary = Array(0..10)    # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ary.insert(5,'five')
ary                   # => [0, 1, 2, 3, 4, "five", 5, 6, 7, 8, 9, 10]


# =====  Sorting  =====
before = [3,6,3,0,8,235,-3]
after  = before.sort
before       # => [3, 6, 3, 0, 8, 235, -3]
after        # => [-3, 0, 3, 3, 6, 8, 235]

  # a bang on the end of a method means "watch out", many methods have a "safe" version which will return a new object
  # and a "dangerous" version, which will mutate the current object. (this is not it's only use, so check the docs ;)
before       # => [3, 6, 3, 0, 8, 235, -3]
before.sort!
before       # => [-3, 0, 3, 3, 6, 8, 235]

  # you can sort based on your own criteria, your block must simply evaluate to -1 , 0 , or 1
  # This is the same as Java's compareTo method. We have a method like that already, our spaceship operator
  # if this example is too confusing, let me know (or if it's cake, you can brag)
after = before.sort do |a,b|
  b <=> a   # sort such that larger elements come first
end
before # => [-3, 0, 3, 3, 6, 8, 235]
after  # => [235, 8, 6, 3, 3, 0, -3]

  # An object with a name and age
class Person
  attr_accessor 'name', 'age'
  def initialize(name, age)
    @name, @age = name, age
  end
  def inspect
    "<#{name}(#{age})>"
  end
end 

  # whatever the block returns will be used to sort the object
people = [
  Person.new( 'Ernie'    , 20 ),
  Person.new( 'Sara'     , 50 ),
  Person.new( 'Monique'  , 10 ),
  Person.new( 'Mohammed' , 60 ),
]
people.sort_by { |person| person.age } # => [<Monique(10)>, <Ernie(20)>, <Sara(50)>, <Mohammed(60)>]



# =====  Adding / removing / replacing / finding elements  =====

  # appending / pushing / popping  (never have to write a stack again)
ary = [1,2,3]
ary << 4
ary             # => [1, 2, 3, 4]
ary.push 5
ary             # => [1, 2, 3, 4, 5]
ary.pop         # => 5
ary             # => [1, 2, 3, 4]

  # if you want to push / pop from the beginning, it's called unshifting and shifting 
  # to help you remember which is which, it might help to associate shift with the assembly command shl
ary = [1,2,3]
ary.unshift 0
ary             # => [0, 1, 2, 3]
ary.shift       # => 0
ary             # => [1, 2, 3]

  # removing items
ary = Array(1..10)             # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ary.delete 5
ary                            # => [1, 2, 3, 4, 6, 7, 8, 9, 10]

ary = Array(1..10)             # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ary.reject { |i| i % 2 == 0 }  # => [1, 3, 5, 7, 9]
ary.select { |i| i % 2 == 0 }  # => [2, 4, 6, 8, 10]

  # checking for an object
ary = Array(3..10)    # => [3, 4, 5, 6, 7, 8, 9, 10]
ary.include?(5)       # => true
ary.index(5)          # => 2
ary.include?(11)      # => false
ary.index(11)         # => nil


# =====  Iterating  =====

  # iterate over each element
sum , ary = 0 , [1,2,3]
ary.each { |num| sum += num }
sum       # => 6
  
  # iterating over each index , capture results in a new Array
results = Array.new
%w(a b c).each_index { |i| results.push i }
results   # => [0, 1, 2]

  # what if you care about both elements and indexes?
results = Array.new
%w(a b c).each_with_index do |character,index|
  results.push "index #{index} holds element #{character}"
end
results   # => ["index 0 holds element a", "index 1 holds element b", "index 2 holds element c"]

  # create a new array, where each element is derived from the original array
  # whatever the block returns (its last line) will be at that index in the new array
ary = [0,1,1,1,1,3]
ary.map { |num| num * 2 }                       # => [0, 2, 2, 2, 2, 6]
ary.map { |num| %w(zero one two three)[num] }   # => ["zero", "one", "one", "one", "one", "three"]

  # iterate over multiple elements
result = []
Array(1..10).each_slice(2) { |a, b| result << [a, b] }
result # => [[1, 2], [3, 4], [5, 6], [7, 8], [9, 10]]

result = []
Array(1..10).each_cons(2) { |a, b| result << [a, b] }
result # => [[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7], [7, 8], [8, 9], [9, 10]]

# ===== Miscellaneous useful shit  =====
  # equality
[1,2,3] == [1,2,3]              # => true
[1,2,3] == [3,2,1]              # => false

  # repetition
[1,22] * 3                      # => [1, 22, 1, 22, 1, 22]

  # concatenation
[1,2] + %w(3 4)                 # => [1, 2, "3", "4"]

  # difference
[1,2,3,4] - [3,5]               # => [1, 2, 4]

  # max and min
[3, 4, 13, 2, -3, 7].max        # => 13
[3, 4, 13, 2, -3, 7].min        # => -3

  # intersection
[1,3,4] & [0,3,4,5]             # => [3, 4]

  # union (order is not guaranteed)
[1,3,4] | [0,3,4,5]             # => [1, 3, 4, 0, 5]

  # convert each element to a string, and join them together
[1,2,3].join(' and ')           # => "1 and 2 and 3"

  # length / size  (get tired of trying to remember which is correct? In Ruby, they both are ^_^)
[1,2,3].length                  # => 3
[1,2,3].size                    # => 3

  # reverse
[1,2,3].reverse                 # => [3, 2, 1]

  # transpose
a = [1,2,3]
b = %w(one two three)
[ a , b ].transpose             # => [[1, "one"], [2, "two"], [3, "three"]]
a.zip b                         # => [[1, "one"], [2, "two"], [3, "three"]]
  
  # assigning to variables
a = [1,2,3]
num1 , num2 , num3 = a
num1                            # => 1
num2                            # => 2
num3                            # => 3

  # "removing" the brackets to feed as arguments
def sum( x , y , z )
  x + y + z
end
a = [1,2,3]
sum(*a)                         # => 6
