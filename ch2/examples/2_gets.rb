puts "Hello, start typing!"

while line = gets
  puts "You submitted #{line.inspect}"
  break if line.chomp == 'exit'
end

puts "Goodbye!"

# now complete challenges 1 and 2