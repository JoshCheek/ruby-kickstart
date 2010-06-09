# You have two different problems to solve, you must get which one it is from a hash
# The default value for the hash should be :count_clumps
# (hint:  var.is_a? Hash)
#
# PROBLEM: count_clumps
# Say that a "clump" in an array is a series of 2 or more adjacent elements of the same value. 
# Return the number of clumps in the given arguments.
# problem_8 1, 2, 2, 3, 4, 4   , :problem => :count_clumps    # => 2
# problem_8 1, 1, 2, 1, 1      , :problem => :count_clumps    # => 2
# problem_8 1, 1, 1, 1, 1      , :problem => :count_clumps    # => 1
#
# I can also bypass your problem_8 method and go directly to count_clumps as so:
# count_clumps 1, 2, 2, 3, 4, 4     # => 2
# count_clumps 1, 1, 2, 1, 1        # => 2
# count_clumps 1, 1, 1, 1, 1        # => 1
#
#
# PROBLEM: same_ends
# return true if the group of N numbers at the start and end of the array are the same. 
# For example, with [5, 6, 45, 99, 13, 5, 6], the ends are the same for n=0 and n=2, and false for n=1 and n=3. 
# You may assume that n is in the range 0..nums.length inclusive.
# 
# The first parameter will be n, the rest will be the input to look for ends from
# problem_8 1, 5, 6, 45, 99, 13, 5, 6   , :problem => :same_ends    # => false
# problem_8 2, 5, 6, 45, 99, 13, 5, 6   , :problem => :same_ends    # => true
# problem_8 3, 5, 6, 45, 99, 13, 5, 6   , :problem => :same_ends    # => false
#
# I can also bypass your problem_8 method and go directly to same_ends as so:
# same_ends 1, 5, 6, 45, 99, 13, 5, 6    # => false
# same_ends 2, 5, 6, 45, 99, 13, 5, 6    # => true
# same_ends 3, 5, 6, 45, 99, 13, 5, 6    # => false


def problem_8(*args)
  hash    = if args[-1].is_a? Hash then args.pop else nil end
  problem = if hash then hash[:problem] else :count_clumps end

  return count_clumps *args if problem == :count_clumps
  return same_ends *args    if problem == :same_ends
end

def same_ends(count, *numbers)
  start  = []
  finish = []
  
  count.times do |i|
    start  << numbers[i]
    finish << numbers[-1 - i]
  end
  
  start == finish.reverse
end

def count_clumps(*numbers)
  clumps     = 0
  previous   = nil
  two_before = nil

  numbers.each do |number|
    clumps += 1 if (previous == number) && !(previous == two_before)
    two_before = previous
    previous = number
  end
  clumps
end