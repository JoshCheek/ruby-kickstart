# invoke this program with a number
# $ ruby 2_check_odd.rb number

def is_odd?(number)
  # it is odd if it has a remainder of 1 when divided by two
  number % 2 == 1
end


# when a user passes an argument to a ruby program
# it is stored in the ARGV array
unless ARGV.first
  puts "You need to submit a number to check"
  exit(1) # Use exit(0) to exit the program early.
end       # If you're exiting because something went wrong, pass a different number like 1


# Unix is too dumb to know the argument is a number, so it passes it in as text
# We'll have to turn it into a number ourselves with to_i (what if the user didn't pass a number?)
number = ARGV.first.to_i

if is_odd?(number)
  puts "Yes, #{number} is odd"
else
  puts "No, #{number} is not odd"
end