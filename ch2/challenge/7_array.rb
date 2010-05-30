# Given an array,
# return true if the value 3 appears in the array exactly 3 times
# and no 3's are next to each other. 

def have_three( ary )
  threes = 0
  previous = nil
  current = nil
  
  ary.each do |element|
    previous = current
    current  = element
    break if previous == 3 && current == 3
    threes += 1 if current == 3
  end

  return false if threes != 3 || (previous == 3 && current == 3)
  true
  
end
  