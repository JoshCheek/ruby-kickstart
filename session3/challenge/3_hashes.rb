# Write a method that takes a string and returns a hash
# whose keys are all the downcased words in the string,
# and values are the number of times these words were seen.
#
# No punctuation will appear in the strings.
#
# Example:
# word_count "The dog and the cat" # => {"the" => 2, "dog" => 1, "and" => 1, "cat" => 1}

# Define function
def word_count(string)
  # Create a new hash
  hash = Hash.new { 0 }
  down = string.downcase.gsub(/[^a-z0-9\s]/i, '').split(' ')
  down.each { |word| hash[word] += 1 }
  hash
end
