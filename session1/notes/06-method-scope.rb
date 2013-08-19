=begin rdoc

<b>When you make a method, remember that it is its own little world,
it doesn't know about anything outside of itself, this is called scope.</b>

 defined? twelve # => nil
 twelve = 12
 defined? twelve # => "local-variable"

 def my_own_little_world
  defined? twelve # => nil
 end

 my_own_little_world # => nil
 defined? twelve     # => "local-variable"



<b>Well that seems pretty useless, eh? Fortunately, there is an internet connection on this world!
You can pass objects, into the method. When we pass an object in, the variable that points to it 
is called an argument or a parameter</b>

<b>person1 and person2 are arguments or parameters</b>
 def beam_me_up( person1, person2 )
  "The away team consists of #{ person1 } and #{ person2 }."
 end

 beam_me_up( "Ryker", "Data" ) # => "The away team consists of Ryker and Data."

=end