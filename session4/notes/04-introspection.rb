# See the cheatsheet for more info (http://goo.gl/7lsJk).


# The most important ones are (we'll talk more about
# what ancestors and superclasses are in a little bit).
"abc".class         # => String
String.ancestors    # => [String, Comparable, Object, Kernel, BasicObject]
Fixnum.superclass   # => Integer


# puts calls to_s, it returns a string for end users
# p calls inspect, it returns a string for developers
# Strings for example, get quotes placed around them.
"abc".inspect       # => "\"abc\""
"abc".to_s          # => "abc"


require 'date'
Date.today.inspect  # => "#<Date: 2011-06-11 (4911447/2,0,2299161)>"
Date.today.to_s     # => "2011-06-11"
