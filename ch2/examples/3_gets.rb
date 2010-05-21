puts "Hello, start typing!"

while line = gets
  puts "You submitted #{line.inspect}"
  break "Goodbye!" if line.chomp == 'exit'
end