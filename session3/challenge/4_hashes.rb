# Write first_pos, a method which takes a string and , returns a hash
# whose keys are all the words in the string, and values are the
# earliest position they were seen in the string.
#
# There will be no punctuation in the strings.
#
# first_pos "The dog and the cat and the cow" # => {"The" => 0, "dog" => 1, "and" => 2, "the" => 3, "cat" => 4, "cow" => 7}
#
# def first_pos(string)
#   to_return = {}
#   string.split.each_with_index do |word, index|
#     to_return[word] = index.to_i if to_return[word] == nil
#   end
#   to_return
# end


def first_pos(string)
  return_hash = {}
  string.split.each_with_index{|word, index|
    if !return_hash.keys.include?(word)
      return_hash[word] = index
    end
  }

  return return_hash
end
