def sum_difference_product
  # wouldn't it be great if we had a method that could perform an action
  # on each element of the array so that we didn't have to say n = n.to_i for all the elements in the array?
  # keep that in mind for the future ;)
  a , b = gets.split
  a = a.to_i
  b = b.to_i
  puts a + b
  puts a - b
  puts a * b
end