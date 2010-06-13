# =====  PERSPECTIVE  =====
# I wouldn't spend much time in this cheatsheet
# I don't think you'll use Range that often, mostly as params to other things like strings or arrays
# The most important thing is to understand 2 dots vs 3 dots, include? and the enumerable methods
# ...which are basically the same as any other enumerable class

# =====  Initializaton  =====
# receives start , end , exclusive = false
Range.new 1 , 5             # => 1..5
Range.new 1 , 5 , true      # => 1...5
1..5                        # => 1..5
1...5                       # => 1...5

(1..5).class                # => Range
(1...5).class               # => Range

# =====  Backwards Ranges  =====
# note, while it looks like this works,
# due to how ranges are used, where the first element is expected to be less than the last
# it is mostly useless :(
5..1                        # => 5..1
Array(5..1)                 # => []

# There are a few times when it isnt useless, but I think the object itself has to override the behaviour in this case
# Arrays, for example, you can access from the front or end
ary = [1,2,3,4,5]
ary[3]                      # => 4
ary[-1]                     # => 5

# so arrays will let you pass a positive and negative value, the first counding up from the start, and the second counting down from the end
ary[3..-1]                  # => [4, 5]


# =====  Caution with Strings  =====
# Be careful using this with Strings, their rules are not always consistent, and can be very confusing
# generally, I would only use it within 1 char Strings
'z'.succ          # => "aa"
'z' < 'aa'        # => false


# =====  Two Dots Vs Three Dots  =====
# Two dots is inclusive
# Three dots is exclusive
# It may be helpful to remember that you must pass **three** args to Range.new to set exclusive to true
# And you place **three** dots between start and end to do the same thing
Array('a'..'e')       # => ["a", "b", "c", "d", "e"]
Array('a'...'e')      # => ["a", "b", "c", "d"]
Array(1..5)           # => [1, 2, 3, 4, 5]
Array(1...5)          # => [1, 2, 3, 4]

(1...5).first         # => 1
(1...5).last          # => 5
(1...5).exclude_end?  # => true

(1..5).first          # => 1
(1..5).last           # => 5
(1..5).exclude_end?   # => false


# =====  Include  =====
(1..5).include? 0       # => false
(1..5).include? 1       # => true
(1..5).include? 2       # => true
(1..5).include? 3       # => true
(1..5).include? 4       # => true
(1..5).include? 5       # => true
(1..5).include? 6       # => false

# Note the answer for 2.5, it checks the first and last elements
# But, 2.5 will never be traversed if we iterate over this range
# Because it goes in discrete quantities
(1..5).include? 2.5     # => true
(1..5).include? "abc"   # => false
(1..5).include? 5       # => true
(1...5).include? 5      # => false


# =====  Iteration From Enumerable Module =====
# returns true if the block is true for every element iterated over
(1..5).all?  { |i| i < 10 }             # => true
(1..15).all? { |i| i < 10 }             # => false

# returns true if the block returns true for any element iterated over
(1..5).any? { |i| i == 3   }            # => true
(1..5).any? { |i| i == 3.5 }            # => false

# each element iterated over is passed to the block, the result is appended to an Array
(1..5).map { |i| i * 10 }               # => [10, 20, 30, 40, 50]
(1..5).map { rand 100   }               # => [32, 20, 11, 74, 70]
('a'..'e').map { |c| c * 3 }            # => ["aaa", "bbb", "ccc", "ddd", "eee"]

# each element iterated over is passed to the block. If the block evaluates truthily for that element, it is returned
(1..5).find { |i| i == 3 }              # => 3
('a'..'z').find { |c| "ruby"[c] }       # => "b"
('a'..'z').find { |c| "RUBY"[c] }       # => nil

('a'..'z').find_all { |c| "ruby"[c] }   # => ["b", "r", "u", "y"]


# enumerable each methods 
result = Array.new
('a'..'i').each_cons(3) { |elements| result << elements }
result # => [["a", "b", "c"], ["b", "c", "d"], ["c", "d", "e"], ["d", "e", "f"], ["e", "f", "g"], ["f", "g", "h"], ["g", "h", "i"]]

result = Array.new
('a'..'i').each_slice(3) { |elements| result << elements }
result # => [["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"]]

result = Array.new
('a'..'i').each_with_index { |element,index| result << [element,index] }
result # => [["a", 0], ["b", 1], ["c", 2], ["d", 3], ["e", 4], ["f", 5], ["g", 6], ["h", 7], ["i", 8]]

# this is what you will be implementing in challenge 2
# the parameter to inject (zero in this case) should be fed as the first parameter to the block
# each element should be passed as the second parameter to the block
# the result of the block will be fed back into the first parameter for the rest of the iterations
# the last result of the block will be returned
(1..5).inject(0) { |sum,element| sum + element }  # => 15

# groups the elements into arrays based on whether the block returns true or false
(1..5).partition { |i| i % 2 == 0 } # => [[2, 4], [1, 3, 5]]
(1..5).reject { |i| i % 2 == 0 }    # => [1, 3, 5]
(1..5).select { |i| i % 2 == 0 }    # => [2, 4]
