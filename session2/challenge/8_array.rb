# Given an array of elements, return true if any element shows up three times in a row
#
# Examples:
# got_three? [1, 2, 2, 2, 3]  # => true
# got_three? ['a', 'a', 'b']  # => false
# got_three? ['a', 'a', 'a']  # => true
# got_three? [1, 2, 1, 1]     # => false

def got_three?(array)
  array.find_all do |e|
    array.count(e)
    return true if array.count(e) == 3
  end
  false
end

got_three? [1, 2, 2, 2, 3]
