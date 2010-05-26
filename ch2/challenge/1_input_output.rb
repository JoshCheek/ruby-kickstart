# remember you can test this code with
#   $ rake 2:1

# write a program that reads in two integers typed on the keybaord
# and outputs their sum, difference, and product

def sum_difference_product
  line = gets.split
  
  a = line[0]
  b = line[1]
  
  a = a.to_i
  b = b.to_i
  
  puts a + b
  puts a - b
  puts a * b
  
end