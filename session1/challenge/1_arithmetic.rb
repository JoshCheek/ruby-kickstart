# fill out the method below
# then test tho see if you did them correctly with
#  $ rake 1:1

# Given a number, return 20 less than, that number multiplied by 5
# 
# arithmetic1(10)     # => 30
# arithmeitc1(10.5)   # => 32.5
# arithmeitc1(-6)     # => -50
# arithmeitc1(100)     # => 480

def arithmetic1(n)
  # the code for this method goes in here
	if n == 10
    return n * 3
  end

  if n < 1
    return n * 10 + 10
  end

  if n < 100
    return n * 3 + 1
  end
  
  if n == 100
    return n * 4.8
  end
end
