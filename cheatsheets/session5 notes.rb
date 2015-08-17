#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/01-modules-introduction.rb file content is listed below
###############################################################################

# Modules are just like classes in that they contain methods. But
# unlike classes, you can't instantiate them. Instead, we include
# their methods in some other class, and then its instances get
# the module's methods.

# A class can only inherit from one other class, but it can include
# as many modules as it likes (this is commonly called a mix-in)

# Because of this (among other things), mixing modules in is usually
# preferred in the Ruby community, rather than subclassing.
# Now, people usually prefer to get functionality by mixing in a
# module rather than subclassing another class.


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/02-modules-including.rb file content is listed below
###############################################################################

# Modules have the feel of a class in that you define methods in them.
# But since they cannot be instantiated, you must declare that the
# methods in the module should be included in a class, and the module
# will be added to the inheritance chain, making its methods available.
module OurModule
  def meth
    'method from OurModule'
  end
end

# When we include OurModule in a class, it becomes an ancestor
class OurClass
  include OurModule
end
OurClass.ancestors # => [OurClass, OurModule, Object, Kernel, BasicObject]

# This means its instances can invoke OurModule's methods
OurClass.new.meth # => "meth from M"


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/03-modules-extending.rb file content is listed below
###############################################################################

# Sometimes we want to give the module's functionality to just one
# object. In this case, we include it in the object's singleton class.
module OurModule
  def meth
    'method from M'
  end
end

obj = Object.new
class << obj
  include OurModule
end
obj.singleton_class.ancestors   # => [OurModule, Object, Kernel, BasicObject]
obj.meth                        # => "method from M"


# Unfortunately, that's a little bit annoying to write, so there
# is a shortcut syntax. Extending an object with a module is the
# same as including the module in its singleton class.
obj = Object.new
obj.extend OurModule
obj.singleton_class.ancestors   # => [OurModule, Object, Kernel, BasicObject]
obj.meth                        # => "method from M"


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/04-modules-example.rb file content is listed below
###############################################################################

# Here is a common example of how we might use modules:
module Threes
  def threes_r0
    self.select { |i| i % 3 == 0 }
  end

  def threes_r1
    select { |i| i % 3 == 1 }
  end

  def threes_r2
    select { |i| i % 3 == 2 }
  end
end



sequence = 0...30
sequence.extend Threes

sequence # => 0...30


# Threes is not on our sequence of numbers, but not on any others.
sequence.singleton_class.ancestors  # => [Threes, Range, Enumerable, Object, Kernel, BasicObject]
(0...30).singleton_class.ancestors  # => [Range, Enumerable, Object, Kernel, BasicObject]


# This means we can call it's methods.
sequence.threes_r0 # => [0, 3, 6, 9, 12, 15, 18, 21, 24, 27]
sequence.threes_r1 # => [1, 4, 7, 10, 13, 16, 19, 22, 25, 28]
sequence.threes_r2 # => [2, 5, 8, 11, 14, 17, 20, 23, 26, 29]

sequence                          # => 0...30
0...30                            # => 0...30
sequence.methods.grep(/threes/)   # => [:threes_r0, :threes_r1, :threes_r2]
(0...30).methods.grep(/threes/)   # => []

# Questions: Where did the select come from in threes_rn?
#            Can you think of another object we could extend with this module?


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/05-nesting-classes-and-modules.rb file content is listed below
###############################################################################

# You can declare classes and modules inside of each other.
class A

  class B
  end

  module C
    module D
      class C
        def self.deep_in_the_hole
          "The further down I go, pulls the strings on my violin bow"
        end
      end
    end
  end

end

# You can then access them with ::
A                             # => A
A::B                          # => A::B
A::C                          # => A::C
A::C::D                       # => A::C::D
A::C::D::C                    # => A::C::D::C
A::C::D::C.deep_in_the_hole   # => "The further down I go, pulls the strings on my violin bow"


# Note that even though they're named the same, these are different,
# like similarly named files in different directories
A::C == A::C::D::C            # => false

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/06-modules-namespacing.rb file content is listed below
###############################################################################

# A great use for modules is as namespaces: You can do all sorts
# of stuff in a module, and it keeps it contained within that
# module. This prevents conflicts with similarly named things
# in other places.

# Example:
# Maybe you want to try the same problem several days in a row,
# to see how your approach changes over time.
module Day1Solutions
  class MinFinder
    def initialize(a, b)
      @a = a
      @b = b
    end
    def solve
      if @a < @b then @a else @b end
    end
  end
end

module Day2Solutions
  class MinFinder
    def initialize(a, b)
      @elements = [a, b]
    end
    def solve
      @elements.min
    end
  end
end

day1 = Day1Solutions::MinFinder.new 10, 5
day2 = Day2Solutions::MinFinder.new 10, 5
day1          # => #<Day1Solutions::MinFinder:0x000001008679b8 @a=10, @b=5>
day2          # => #<Day2Solutions::MinFinder:0x00000100867990 @elements=[10, 5]>
day1.solve    # => 5
day2.solve    # => 5


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/07-extending-main.rb file content is listed below
###############################################################################

# Lets say that we want to escape html output. This prevents someone
# from submitting html to a form and having it mess up our page's
# html when we put it in there gets displayed. Well, there is a method
# to do this in ERB::Util, which we can get from the standard library
require 'erb'

ERB::Util.h "<script>" # => "&lt;script&gt;"


# But that means that each time we want to use it,
# we have to write ERB::Util.h    ugh -.^


# But wait a minute, ERB::Util is a module
ERB::Util.class # => Module


# That means we can put it on main's singleton class
extend ERB::Util
singleton_class.ancestors # => [ERB::Util, Object, Kernel, BasicObject]
h "<script>" # => "&lt;script&gt;"


# This is a common way to get nicer functionality. For example, the
# FileUtils module (http://ruby-doc.org/core/classes/FileUtils.html),
# from the Ruby standard library extended onto main into Object, when
# working with rake files, this lets you say things like `mkdir 'ch4'`
# instead of `FileUtils.mkdir 'ch4'`


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/08-regex-introduction.rb file content is listed below
###############################################################################

# Regular expressions are one of those things that look really scary,
# and take some time to get used to, but they are not that difficult
# to use, and they are _very_ useful. These are probably the things
# that are most useful to a non programmer, their job is to help you
# process Strings. They are patterns that strings can fit into.
# And they are mostly pretty easy :). You just have to learn a few
# rules, and have a cheatsheet until you get to know them.


# First, go check out rubular.com where you can put in a String and
# a regular expression, and you can see all the places it matches
# For the regular expression enter "b.b" and for the String,
# "bobbling babbling bubbles" Notice that it has highlighted "bob",
# "bab", and "bub". These are the areas where your regular expression
# matches the String (the dot matches any character).

# Strings begin and end with quotes, regexes with slashes
/this is a regular expression/


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/09-regex-how-to-match.rb file content is listed below
###############################################################################

# There are several common ways of matching regular expressions.
# The most common is the =~ operator. This is the only place you
# will see that operator, it is the choice for mostly historical
# reasons (inherited notation from Perl and somewhat from Awk)
# This operator returns the first index of the first match, or nil.
"Sal Khan" =~ /S/                         # => 0
"Sal Khan" =~ /a/                         # => 1
"Sal Khan" =~ /l/                         # => 2
"Sal Khan" =~ /W/                         # => nil
"Sal Khan" =~ /s/                         # => nil

# If you pass a regular expression to a String's [] method,
# then it will return where it matches
"bobbling babbling bubbles"[/b.b/]        # => "bob"
"bobbling babbling bubbles"[/B.b/]        # => nil

# If you pass it to the scan method, it will return an array
# of all the matches.
"bobbling babbling bubbles".scan(/b.b/)   # => ["bob", "bab", "bub"]


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/10-regex-characters.rb file content is listed below
###############################################################################

# Any alphanumeric character will match itself.
"abc"[/b/]                                # => "b"


# Use brackets to declare a set of characters to match
# Match any character not in the set by leading it with a caret.
"proud pink pandas".scan(/p[aeiou]/)      # => ["pi", "pa"]
"proud pink pandas".scan(/p[^aeiou]/)     # => ["pr"]


# The dot will match any character except newlines.
"proud pink pandas".scan(/pr/)            # => ["pr"]
"proud pink pandas".scan(/pi/)            # => ["pi"]
"proud pink pandas".scan(/pa/)            # => ["pa"]
"proud pink pandas".scan(/p./)            # => ["pr", "pi", "pa"]


# You can give character ranges inside of brackets.
alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
alphabet.scan(/[a-cmnoy-z]/)              # => ["a", "b", "c", "m", "n", "o", "y", "z"]

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/11-regex-repetition.rb file content is listed below
###############################################################################

# * to match zero or more
"aabc"[/x*/]                # => ""
"aabc"[/a*/]                # => "aa"

# + to match one or more
"aabc"[/x+/]                # => nil
"aabc"[/a+/]                # => "aa"

# ? to match 0 or 1
"abcde abde".scan(/bc?d/)   # => ["bcd", "bd"]

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/12-regex-boundaries.rb file content is listed below
###############################################################################

# To match the beginning of a line, use the caret (outside of the
# brackets) and to match the end, use the dollar sign.
"a b"[/^./]  # => "a"
"a b"[/.$/]  # => "b"


# You can match the boundaries between alphanumeric
# and non-alphanumeric with \b
dijkstra = "Elegance is not a dispensable luxury but a factor that decides between success and failure."
dijkstra.scan(/\bd[a-z]*/) # => ["dispensable", "decides"]


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/13-regex-groups.rb file content is listed below
###############################################################################

# You can logically group multiple characters with parentheses
# Each will be captured according in variables $1, $2, ...
regex = /(.).(.).(.)/
"abcde" =~ regex
$1                                        # => "a"
$2                                        # => "c"
$3                                        # => "e"


# A pipe acts as an "or"
regex = /big (dog|boy)/

"I bought a big truck today"[regex]       # => nil

"He is a big boy now."[regex]             # => "big boy"
$1                                        # => "boy"

"That is one big dog over there."[regex]  # => "big dog"
$1                                        # => "dog"


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/14-gems-introduction.rb file content is listed below
###############################################################################

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


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/15-rubygems-introduction.rb file content is listed below
###############################################################################

# So gems sound great, everyone can share their code with each other.
# Just one problem, _how_ do we share it?

# Well, for that, there is RubyGems! http://rubygems.org a giant
# repository of gems that anyone can upload their gems to, or get
# their gems back from.

# You can peruse RubyGems, or check out http://ruby-toolbox.com/
# for a compilation of gems based on the types of tools you need.
# This is a great place to get ideas and see what tools the rest of
# the community think are useful for addressing certain types of
# problems.


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/16-rubygems-updating.rb file content is listed below
###############################################################################

# RubyGems has a command line tool that lets you install the gems
# You've already got got it, run "$ gem -v" to see what version
# you have.

# If your RubyGems is old, you might update it with
# "$ gem update --system"


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/17-gems-installing.rb file content is listed below
###############################################################################

# Lets say we want to write a web application. There are a ton of
# gems to help you do this
# http://ruby-toolbox.com/categories/web_app_frameworks.html


# I like Sinatra a lot. In fact, that's what ruby-kickstart.com uses!
# Lets go check out its RubyGems page http://rubygems.org/gems/sinatra


# Looks good, lets install it. We just need to tell RubyGems that
# we want it, and it will take care of everything involved.
# "$ gem install sinatra"


# If you have difficulty, it could be that your RubyGems is installed
# somewhere that requires you to be a superuser to make changes. In
# that case, try running "$ sudo gem install sinatra".


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/18-gems-using-sinatra.rb file content is listed below
###############################################################################

# We can require Sinatra just like any other library
# (in Ruby 1.8, you first have to `require "rubygems"`)
require 'sinatra'

# Run this file, then go to "http://localhost:4567/" to try it out.
get '/' do
  "Hello, world!"
end


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session5/notes/19-go-do-the-challenges.rb file content is listed below
###############################################################################

# Okay go try out the challenges now. Don't forget, there's
# cheatsheets for regular expressions
#   https://github.com/JoshCheek/ruby-kickstart/blob/master/cheatsheets/regular_expressions.rb
# and for RubyGems
#   https://github.com/JoshCheek/ruby-kickstart/blob/master/cheatsheets/rubygems.rb
#

################################## -- END -- ##################################



