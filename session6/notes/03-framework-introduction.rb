# The server deals with all the internet stuff, and rack gives
# my applications a consistent and simple interface to the server,
# my applications just have to figure out what they want to do.

# But this isn't very much infrastructure, I have to still do all
# the work of parsing that big hash table and figuring out what it
# means for my application.

# To make this simpler, we use frameworks. Frameworks give us the tools
# (as gems) that we need to do things that make sense on the internet.
# They give us an interface so we can think about the stuff that
# matters in a way that is idiomatic for the web.

# Ruby on Rails is the most popular Ruby framework, it goes so far
# as to specify how your applications should be laid out, what
# abstractions you should use, how you should name your classes and
# variables.

# Sinatra is a much much simpler framework, it really gives you a
# minimal interface to match incoming requests and return a response.
# It also handles all the templating for you (taking data and
# making a web page out of it). The http://ruby-kickstart.com code
# is written in Sinatra. So is my own webpage, http://joshcheek.com

