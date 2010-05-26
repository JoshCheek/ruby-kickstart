# Given a string, return a string made of the chars at indexes 0,1, 4,5, 8,9 ... so "kittens" yields "kien".
# 
# alt_pairs("kitten")       # => "kien"
# alt_pairs("Chocolate")    # => "Chole"
# alt_pairs("CodingHorror") # => "Congrr"

def alt_pairs(str)
  return_string = ""
  str.length.times do |i|
    if i / 2 % 2 == 0
      return_string += str[i..i]
    end
  end
  return return_string
end