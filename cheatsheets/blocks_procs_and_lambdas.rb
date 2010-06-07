# =====  Initializing A Proc  =====
# the differences are subtle, and I'm not even sure completely any more
# I usually go with proc or lambda, if it isn't behaving the way you like
# try switching them out.
Proc.new { |param1,*params,&block| 'code goes here' } # => #<Proc:0x000000010019cb38@-:5>
proc     { |param1,*params,&block| 'code goes here' } # => #<Proc:0x000000010019b8f0@-:6>
lambda   { |param1,*params,&block| 'code goes here' } # => #<Proc:0x000000010019a658@-:7>

# =====  Invoking a Proc  =====

month = proc do |month_number| 
  %w(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)[ month_number-1 ]
end
month.call 1  # => "Jan"
month.call 2  # => "Feb"
month[3]      # => "Mar"
month[4]      # => "Apr"


# =====  Receiving a Block in a Method  =====
# place an ampersand in front of the block variable
# it will convert the block into a proc so that you can manipulate it as a variable
def my_method( a , &block )
end