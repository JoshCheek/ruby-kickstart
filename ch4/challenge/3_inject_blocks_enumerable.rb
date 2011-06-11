# You are going to write a method called passthrough
# It receives an enumerable object, and an initial passthrough value, and a block
# 
# For each of the elements in the enumerable object,
# it passes them the passthrough value and the element.
# Whatever the block returns, must be passed in as the
# next passthrough value for the next element.
#
# After we go through all the elements, the last passthrough value is returned to the caller
#
#
# EXAMPLE:
#
# passthrough 5..10 , 0 do |sum,num|
#   sum + num
# end
# 
# This should return 45 in the following manner:
#   The first time the block is passed    0 ,  5 and it returns 5
#   The second time the block is passed   5 ,  6 and it returns 11
#   The third time the block is passed   11 ,  7 and it returns 18
#   The fourth time the block is passed  18 ,  8 and it returns 26
#   The fourth time the block is passed  26 ,  9 and it returns 35
#   The fourth time the block is passed  35 , 10 and it returns 45
#   The method then returns 45
#

def passthrough
end