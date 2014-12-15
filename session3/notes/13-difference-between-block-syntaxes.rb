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
