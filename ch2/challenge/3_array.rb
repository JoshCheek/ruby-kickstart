# Given an array of elements
# return a new array length 2 containing the first and last elements from the original array.
# The original array will be length 1 or more.
# 
# make_ends( [1, 2, 3]    )                     # =>  [1, 3]
# make_ends( [1, 2, 3, 4] )                     # =>  [1, 4]
# make_ends( [7, 4, 6, 2] )                     # =>  [7, 2]
# make_ends( %w[the quick brown fox] )          # =>  ['the', 'fox']
# make_ends( [/r/ , /e/ , /g/ , /e/ , /x/] )    # =>  [/r/, /x/]

def make_ends(ary)
  [ary[0], ary[-1]] if ary
end