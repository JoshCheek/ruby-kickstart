# Write a method named every_other_char for strings that,
# returns an array containing every other character
#
# example:
# "abcdefg".every_other_char  # => "aceg"
# "".every_other_char         # => ""

class String
  def every_other_char
    array = ""
    each_char.with_index do |char, index|
      array << char if index.even?
    end
    array
  end
end
