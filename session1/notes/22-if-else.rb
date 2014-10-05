# Lets say you actually want to do something conditionally

if 4 == (2 + 2)
  "I get evaluated"   # => "I get evaluated"
else
  "I don't :("        # =>
end


my_number = 56

if my_number < 12
  puts "Fewer than a dozen"
elsif my_number < 64
  puts "You could hold me in 6 bits"
else
  puts "That's a pretty big number"
end

  # Output:
  # You could hold me in 6 bits
  #


'one line if statement'     if true       # => "one line if statement"
'one line unless statement' unless false  # => "one line unless statement"

