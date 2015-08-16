# Write a method named every_other_char for strings that,
# returns an array containing every other character
#
# example:
# "abcdefg".every_other_char  # => "aceg"
# "".every_other_char         # => ""

class String
  def every_other_char
  	result = ''
  	self.split('').each.with_index{|x,i| result += x if i%2 == 0 }
  	return result
  end
end

#puts "#{''.every_other_char}"
