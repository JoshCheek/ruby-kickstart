# given a string, return the character after every letter "r"
#
# pirates_say_arrrrrrrrr("are you really learning Ruby?") # => "eenu"
# pirates_say_arrrrrrrrr("Katy Perry is on the radio!")   # => "rya"
# pirates_say_arrrrrrrrr("Pirates say arrrrrrrrr")        # => "arrrrrrrr"

def pirates_say_arrrrrrrrr(string)
  # Create empty string
  answer = ""
  # Set as false to automatically append characters to the empty strgin
  next_char = false
  # Loop through each character of the supplied string
  string.size.times do |x|
    # The current letter the loop is focussing on
    letter = string[x]
    # Next char set to False, so will not append character to the string, unless it is True
    answer << letter if next_char
    # When an 'r' or 'R' is found 'next_char' is set to true
    # This will mean the next letter in the loop will be appended
    # When not found it sets next_char back to 'False'
    next_char = (letter == "r" || letter == "R")
  end
  # Return answer
  answer
end
