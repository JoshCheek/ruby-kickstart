# recognize that inject method? ;)
# pass a count through each of the valid indexes, 
# incrementing it if the last 3 chars in the string are the same
def count_triple( str )
  (2...str.length).inject 0 do |count,i|
    count += 1 if str[i] == str[i-1] && str[i-1] == str[i-2]
    count
  end
end


# split the string into a char array, then look at each group of 3
# consecutive elements. Whenever they are all the same, increment the sum
def count_triple(str)
  sum = 0
  str.split(//).each_cons 3 do |a,b,c|
    sum += 1 if a == b && b == c
  end
  sum
end


# use regex to find sets of the same element 3x in a row
# use a zero space look ahead so that we can overlap matches
# thus the regex takes up only 1 character
# so when we substitute it with an empty string, we are essentially
# just removing the first character from it
# 
# then we just count the difference in string lengths
def count_triple(str)
  str.length - str.gsub(/(.)(?=\1\1)/,'').length
end


