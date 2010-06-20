puts "Enter numbers to be sorted. Or 'quit' to quit"

while (line = gets) !~ /^q(uit)?$/i
  matched = line.scan(/^(?:(?:\d+)\s)+$/)
  if matched.empty?
    puts "Only input numbers separated by spaces."
  else
    numbers = matched.first.split(" ").map {|num| num.to_i}
    puts numbers.sort.join(" ")
  end
end