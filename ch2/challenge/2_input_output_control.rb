# This challenge is an extension of example 2, so we've included its source as a starting point
#
# Prompt the user for a number, then read it in and print out "hi" that many times
# 
# Repeat this process until the user submits "bye", then say "goodbye" and end the program

# example:
# PROGRAM: Enter a number
# USER:    4
# PROGRAM: hi hi hi hi
# PROGRAM: Enter a number
# USER:    2
# PROGRAM: hi hi
# PROGRAM: Enter a number
# USER:    bye
# PROGRAM: goodbye


# remember you can try your program out with              $ ruby 2_input_output_control.rb
# and when you think it is correct, you can test it with  $ rake 2:2

def hi_hi_goodbye


  
  puts "Hello, start typing!"

  while line = gets
    puts "You submitted #{line.inspect}"
    break if line.chomp == 'exit'
  end

  puts "Goodbye!"
  
  
  
end




# a little magic so that you can run your file, but it will still work for our tests
# you can disregard it :)
hi_hi_goodbye if $0 == __FILE__  