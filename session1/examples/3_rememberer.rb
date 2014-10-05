# This program uses things you haven't seen yet.
# Can you look at it and figure out what it is doing?

lines_seen = []


loop do

  # Why do we chomp? Can you use irb to figure out the difference between gets, and gets.chomp ?
  line = gets.chomp
  break if line == "exit"

  if lines_seen.include? line
    puts "Yes, I've seen #{line} before"
  else
    puts "No, I haven't seen #{line} before"
    lines_seen << line
  end
end

