def prompt
  puts 'Enter a number or bye'
end

def hi_hi_goodbye
  prompt
  while (line = gets) && (line !~ /bye/) # first is an assignment statement that returns a line or nil, and is thus boolean
    line.to_i.times { print 'hi ' }
    puts
    prompt
  end
  puts "Goodbye!"
end





hi_hi_goodbye if $0 == __FILE__  # a little magic so that you can run with "$ ruby 2_input_output_control.rb" but it will still work for our tests
