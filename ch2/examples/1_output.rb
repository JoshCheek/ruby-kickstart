number = 5
other_number = 12

puts "first line"

puts "The number we have is #{number} and the sum of our numbers is #{number + other_number}" 
# >> The number we have is 5 and the sum of our numbers is 17

print "this will all be "
print "on the same line"

puts # an empty newline

# field types can be seen at http://ruby-doc.org/core/classes/Kernel.html#M005962
printf "%d is %b in binary, %x in hex, and %o in octal\n" , 95 , 95 , 95 , 95
printf "%10s\n" , 'hello'
printf "%10s\n" , 'world'
