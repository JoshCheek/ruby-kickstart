# We'll say that a number is "teen" if it is in the range 13..19 inclusive. Given 3 int values, return true if 1 or more of them are teen.
# 
# has_teen(13, 20, 10) # => true
# has_teen(20, 19, 10) # => true
# has_teen(20, 10, 13) # => true

def has_teen( a , b , c )
  if (a >= 13 && a <= 19)
    return true 
  end
  if (b >= 13 && b <= 19) 
    return true 
  end
  if (c >= 13 && c <= 19) 
    return true 
  end
  
  return false
end
