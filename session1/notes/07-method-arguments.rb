=begin rdoc

<b>You know how you and I can go to the same website, but even though we both see it in our browser, there is only one website?</b>

<b>Objects are the same way, when you pass one in, you can access it from the variable outside and and inside the method, but there is still just one object.</b>

 def browser_goto( website )
  website.object_id     # => 2151945040, 2151945040
  "Direct your browser towards #{ website }"
 end

<b>The same object id means they are the same object.</b>
 website = "ruby-kickstart.com"
 website.object_id       # => 2151945040
 browser_goto( website )   # => "Direct your browser towards ruby-kickstart.com"

<b>Ruby likes to be beautiful, it doesn't make you put parentheses where it can figure out what you meant.</b>
 browser_goto website    # => "Direct your browser towards ruby-kickstart.com"

=end