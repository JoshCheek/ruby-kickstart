# Methods will raise an error if you give them the wrong number
# of arguments. But blocks will not.
[1,2,3].map { 0 } # => [0, 0, 0]


# A return statement in a method will from return it. But a return
# statement in a proc will return from the enclosing environment.
def first_even(nums)
  nums.each do |num|
    return num if num.even?
  end
  nil
end
first_even [1,5,7,4,19,8] # => 4
