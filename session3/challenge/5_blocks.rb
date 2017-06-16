# Write a method, spiral_access, that takes a 2d square array (an array of arrays)
# and a block, and calls the block for each of the elements, in spiral order.
#
# HINT: This method is probably best sovled recursively
#
# Example:
# two_d = [
#   [ 1,  2,  3,  4, 5],
#   [16, 17, 18, 19, 6],
#   [15, 24, 25, 20, 7],
#   [14, 23, 22, 21, 8],
#   [13, 12, 11, 10, 9],
# ]
# order = []
# spiral_access two_d do |i|
#   order << i
# end
# order # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]

def spiral_access(arrays, iteration=0, &block)
  y_max = arrays.length - 1
  x_max = arrays.first.length - 1

  # base step
  return if y_max/2 < iteration || x_max/2 < iteration

  # top row
  iteration.upto x_max-iteration do |x|
    block.call arrays[iteration][x]
  end

  # right column
  (iteration + 1).upto y_max-iteration do |y|
    block.call arrays[y][x_max-iteration]
  end

  # bottom row
  (x_max - 1 - iteration).downto iteration do |x|
    block.call arrays[y_max-iteration][x]
  end

  # left column
  (y_max - 1 - iteration).downto iteration+1 do |y|
    block.call arrays[y][iteration]
  end

  # recursive step
  spiral_access arrays, iteration+1, &block
end
