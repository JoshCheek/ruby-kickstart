# Given n >= 0, create an array length n*n with the following pattern, 
# shown here for n=3 : [0, 0, 1,   0, 2, 1,    3, 2, 1] (spaces added to show the 3 groups).
#
# EXAMPLES:
# square_up(3) # => [0, 0, 1, 0, 2, 1, 3, 2, 1]
# square_up(2) # => [0, 1, 2, 1]
# square_up(4) # => [0, 0, 0, 1, 0, 0, 2, 1, 0, 3, 2, 1, 4, 3, 2, 1]

def square_up(n)
  return [0] if n == 0
  
  ary = Array.new n * n
  
  inner = -1
  cycle = n - 1
  
  ary.each_index do |index|
    cycle -= 1 if index % n == 0
    inner = (inner + 1) % n
    ary[index] =  if inner > cycle then n - inner else 0
    end
  end
end

