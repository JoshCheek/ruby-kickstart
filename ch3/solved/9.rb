# mathy solution
def square_up(n)
  return [0] if n.zero?
  Array.new n*n do |i| 
    outer_index = i / n
    inner_index = i % n
    if n - inner_index <= 1 + outer_index
      n - inner_index
    else
      0
    end
  end
end



# arrayish solution
def square_up(n)
  
  # handle the outlier
  return [0] if n.zero?
  
  # aggregate all the inner arrays inside this var
  arrays = Array.new
  
  # generate the inner arrays
  n.times do
    arrays << Array(1..n).reverse
  end
  
  # set the appropriate indexes to zero (due to counting, gets applied in reverse)
  # not difficult to switch, but requires a little math to think about it, and I
  # already made a mathy solution :)
  arrays.each_with_index do |array,outer_index|
    outer_index.times { |inner_index| array[inner_index] = 0 }
  end
  
  # the zero masking is applied in reverse, so we
  # reverse the arrays to get the appropriate order
  arrays.reverse.flatten
end
