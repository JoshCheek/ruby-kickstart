# Given a sentence, return an array containing every other word.
# Punctuation is not part of the word unless it is a contraction.
# In order to not have to write an actual language parser, there won't be any punctuation too complex.
# There will be no "'" that is not part of a contraction.
# Assume each of these  charactsrs are not to be considered: ! @ $ # % ^ & * ( ) - = _ + [ ] : ; , . / < > ? \ |
#
# Examples
# alternate_words("Lorem ipsum dolor sit amet.")  # => ["Lorem", "dolor", "amet"]
# alternate_words("Can't we all get along?")      # => ["Can't", "all", "along"]
# alternate_words("Elementary, my dear Watson!")  # => ["Elementary", "dear"]

def alternate_words(strings)
  # Remove punctuation
  '!@$#%^&*()-=_+[]:;,./<>?\\|'.split(//).each do |char|
    strings = strings.gsub(char, ' ')
  end
  p strings
  # Split the returning sentence up into an array
  word = strings.split
  p word
  # Create an empty array
  array = []
  # Loop through each object in the array and only push even ones back into the array
  word.each_with_index { |x, y| array << x if y.even? }
  # Return array
  p array
  array
end
alternate_words("Can't we all get along?")
