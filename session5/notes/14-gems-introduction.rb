# So you can do pretty much anything with Ruby. But you will have
# to build all the tools yourself. When you write code that is
# intended to be used as a tool by other software, that is called
# a library.

# In Ruby, the tool that knows how to work with dates is a library.
# If I want to work with dates, I just require that library, and
# now I magically have all of its functionality! What a treasure
# trove of useful code, libraries are ^_^
require 'date'
Date.today # => #<Date: 2011-06-17 (4911459/2,0,2299161)>


# Date comes with Ruby, in something called the standard library
# http://ruby-doc.org/stdlib/

# But there are other libraries, libraries written by people like
# you and me. We call these libraries gems.

