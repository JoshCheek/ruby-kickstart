# Here is a common example of how we might use modules:
module Threes
  def threes_r0
    self.select { |i| i % 3 == 0 }
  end

  def threes_r1
    select { |i| i % 3 == 1 }
  end

  def threes_r2
    select { |i| i % 3 == 2 }
  end
end



sequence = 0...30
sequence.extend Threes

sequence # => 0...30


# Threes is not on our sequence of numbers, but not on any others.
sequence.singleton_class.ancestors  # => [Threes, Range, Enumerable, Object, Kernel, BasicObject]
(0...30).singleton_class.ancestors  # => [Range, Enumerable, Object, Kernel, BasicObject]


# This means we can call it's methods.
sequence.threes_r0 # => [0, 3, 6, 9, 12, 15, 18, 21, 24, 27]
sequence.threes_r1 # => [1, 4, 7, 10, 13, 16, 19, 22, 25, 28]
sequence.threes_r2 # => [2, 5, 8, 11, 14, 17, 20, 23, 26, 29]

sequence                          # => 0...30
0...30                            # => 0...30
sequence.methods.grep(/threes/)   # => [:threes_r0, :threes_r1, :threes_r2]
(0...30).methods.grep(/threes/)   # => []

# Questions: Where did the select come from in threes_rn?
#            Can you think of another object we could extend with this module?

