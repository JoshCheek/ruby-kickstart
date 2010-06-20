# =====  Exceptions  =====
# errors and exceptions are used to say "something fucked up"
# it halts evaluation, and returns to where it was called from
# incrementally making its way up the stack (the series of methods that were called to get to 
# wherever the exception was raised) until it is either rescued, or crashes the program

# There are quite a few exceptions in Ruby (one of your challenges will be to find them :)
# You've seen them before, but perhaps didn't know what they were
def method_with_one_parameter(n) end
begin
  method_with_one_parameter(1,2,3)
rescue => e
  e                 # => #<ArgumentError: wrong number of arguments (3 for 1)>
  e.class           # => ArgumentError
  e.class.ancestors # => [ArgumentError, StandardError, Exception, Object, Kernel, BasicObject]
end

# You can rescue specific exceptions if you like
begin
  method_with_one_parameter(1,2,3)
rescue ZeroDivisionError => e
  e # => 
rescue ArgumentError => e
  e # => #<ArgumentError: wrong number of arguments (3 for 1)>
end

begin
  1 / 0
rescue ZeroDivisionError => e
  e # => #<ZeroDivisionError: divided by 0>
rescue ArgumentError => e
  e # => 
end

# If you handle the exception, you may want to try again
numerator = 100
denominator = 0
begin
  result = numerator / denominator
rescue ZeroDivisionError => e
  denominator += 1
  retry
end
result        # => 100
denominator   # => 1

# You can raise your own exceptions
def show_exception
  begin
    yield
  rescue Exception => e
    e
  end
end

def get_names(full_name)
  raise ArgumentError.new("you need to submit the name as 'Firstname Lastname'") unless full_name[ /^[A-Z][a-z]* [A-Z][a-z]*$/ ]
  full_name.split
end

show_exception { get_names 'josh cheek' } # => #<ArgumentError: you need to submit the name as 'Firstname Lastname'>
show_exception { get_names 'Josh Cheek' } # => ["Josh", "Cheek"]

# QUESTION: Why did our program return an ArgumentError? We caught an Exception



# =====  Regular Expressions  =====
# Regular expressions are one of those things that look really scary, and take some time to get used to
# But they are not that difficult to use, and they are _very_ useful. 
# These are probably the things that are most useful to a non programmer
# Their job is to help you process Strings. They are patterns that strings can fit into.
# And they are mostly pretty easy :) You just have to learn a few rules, and have a cheatsheet until you get to know them
# 
# First, go check out rubular.com where you can put in a String and a regular expression, and you can see all the places it matches
# For the regular expressino enter "b.b" and for the String, "bobbling babbling bubbles" 
# Notice that it has highlighted "bob", "bab", and "bub"
# These are the areas where your regular expression matches the String.

# you can match specific characters by typing them out, and a single character against a set by placing them in brackets (negate by beginning with a caret)
# The dot will match any character except newlines
"proud pink pandas".scan(/pr/)            # => ["pr"]
"proud pink pandas".scan(/pi/)            # => ["pi"]
"proud pink pandas".scan(/pa/)            # => ["pa"]
"proud pink pandas".scan(/p./)            # => ["pr", "pi", "pa"]
"proud pink pandas".scan(/p[aeiou]/)      # => ["pi", "pa"]
"proud pink pandas".scan(/p[^aeiou]/)     # => ["pr"]

# you can give ranges inside of brackets
alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
alphabet.scan(/[a-cmnoy-z]/)              # => ["a", "b", "c", "m", "n", "o", "y", "z"]

# to match the beginning of a line, use the caret (outside of the brackets) and to match the end, use the dollar sign.
# to match "zero or more" use a splat, to match "one or more" use a plus
"hello world"[/[a-z]+/]                   # => "hello"
"hello world"[/^[a-z]+$/]                 # => nil
"helloworld"[/^[a-z]+$/]                  # => "helloworld"

# you can logically group multiple characters with parentheses, a pipe acts as an "or"
# whatever the parentheses sourround, it will be captured in the global variables $1 , $2 , ... 
regex = /big (dog|boy)/
"I bought a big truck today"[regex]       # => nil
"He is a big boy now."[regex]             # => "big boy"
$1                                        # => "boy"
"That is one big dog over there."[regex]  # => "big dog"
$1                                        # => "dog"

# you can use regular expressions to check user input in a smarter, more tolerant way
# (when taking in user input, remember to use chomp to remove the newline)

user_input = "quit"
true if user_input =~ /^q(uit)?$/i # => true

user_input = "q"
true if user_input =~ /^q(uit)?$/i # => true

user_input = "QUIT"
true if user_input =~ /^q(uit)?$/i # => true

user_input = "quip"
true if user_input =~ /^q(uit)?$/i # => nil

# let's get a number and a word from the user, and capture them to use later

user_input = "60 cat_5"
user_input =~ /^(\d+) (\w+)$/

number = $1.to_i # => 60
word   = $2      # => "cat_5"

number * 400     # => 24000



# =====  Require  =====
# when you are in one Ruby file, and you want to load another one in, you use the key word require
require '../examples/1_load_me'

# now we can use methods that are defined in that file
say_hello # => "hello"

# we can also load files from the standard library this way
Module.constants.grep(/erb/i) # => []
require 'erb'
Module.constants.grep(/erb/i) # => [:ERB]





# =====  Rubygems / Installing Sinatra  =====
# Sometimes you need to use third party libraries with Ruby, because that is where al the fun stuff is ^_^
# In Ruby, third party libraries are called gems
# You can see a giant repository of gems at rubygems.org
# 
# We are interested in the minimalist web framework Sinatra, so type "sinatra" into the search box, and press return
# Then click the link to the Sinatra gem
# At the top it gives you a description of what it does
# Then in green it shows you how to install the gem
# And it also gives you links to where the code is hosted, the project's homepage, and other useful things
#
# Lets install Sinatra, we will use the command that rubygems told us about
# $ gem install sinatra            
# (note that on Mac OSX, the path to your local gem dir is not in your $PATH, you can either add it, or use $ sudo gem install sinatra)
#
# Now we want the Sinatra gem available to us.
# For some reason that I don't really understand, but involves the path again,
# We have to require rubygems before we can do anything with our gem.
require 'rubygems'

# and now that we have rubygems, we can require the Sinatra library
# example 3 shows how we require Sinatra, as well as a very simple Sinatra program
#
# run the file and go to http://localhost:4567/


# =====  Sinatra  =====
# There are different ways that you can connect to a server with http, they are get, put, post, and delete
# When you type a URL into your web browser and hit return, that is a get request
# In Sinatra, those are method names that you can give to indicate that you want to define some code 
# that will respond to some particular http method
#
# So we tell Sinatra that we want to respond to get methods, then we pass it the string '/'
# Sinatra uses this to identify the url your code should respond to. In this case, localhost:4567/ <-- the slash from above
# if we had said '/hello' then it would respond to localhost:4567/hello
#
# And the last thing we pass is a block.
# whatever this block returns will be what the server returns when we visit that url in our browser.
# In this case, we go to localhost:4567/ and it return "Hello world!" just like we told it to

class << self # faking the Sinatra methods so that I can show without requiring the actual gem
  %w(get put post delete).each { |method_name| define_method(method_name){|arg,&block|} }
end

# The paths that Sinatra takes get turned into regular expressions, and matched against the url of the http request
# you can pull certain parts out of the url, and have them available in a hash table. Here is an example:
get '/greet/:firstname' do
  "Hello, #{ params[:firstname].capitalize }, a pleasure to meet you!"
end

# When you post form data to the server, the information that was posted is also available through the params hash.
# Lets look at example 4 to see how this works.


# =====  Shotgun  =====
# Now we have a problem. When we modify our data, we have to restart our server
# That is really annoying -.- What if there was a gem out there that knew how to reload our information
# each time we made a request? Then changes would be seen immediately.
# If you can't see where this is going, you deserve to get shot. With a shotgun. 
# Which, is coincidentally the name of the gem you need to go install... RIGHT NOW!

# Okay, welcome back, hope you have shotgun installed. If not, you need to be doing, not reading.
# Now, run the file with "$ shotgun sinatra_file.rb" instead of "$ ruby sinatra_file.rb"
# make a change to the file, save it, and see if you can see it in your browser without having to restart your server
# (you will need to reload the page, though)

# one thing to notice is that shotgun hosts your server on port 9393 instead of 4567


# =====  Our First App!  =====

# Lets go create our first app. We will create it in the examples 5 directory.
#
# Once we are done and satisfied that our app is running, we want to put it on the internet for the world to see.
# We will use Heroku, because heroku is simple, easy to use, and free.
# First, go make your accounts
# Then install the heroku gem (you should be gettin the hang of this by now ;)

# Now, Heroku works with git. It sets itself up as a repote repository for your code. Then you can just use git to push your code to Heroku.
# It is as easy as that! Well... almost. We need to do one tiny bit of configuration

# =====  Rack  =====
# There is a gem sitting underneat of Sinatra called Rack. You may have noticed Sinatra installed it when you installed Sinatra.
# Rack is sort of a convention for how ruby web frameworks might choose to do their business. Lots of people recognized the benefits of this
# and so now tons of web frameworks sit on top of Rack. Ruby on Rails is another Ruby web framework that sits on top of Rack.
#
# Heroku supports all rack based applications. Since our application is on Sinatra, it is a rack based application.
# Heroku expects our rack configuration information to be inside of a file called config.ru
# So we need to make that file
# 
# Inside the file, we just need to require our actual sinatra file, and pass the Sinatra::Application class to rack.
# When new request come in, rack will then create an instance of the Sinatra::Application that we defined in the other file
# and then pass the requests to it 
#
# require '5_calculator'
# run Sinatra::Application


# =====  Git and Heroku As a Remote Repo  =====
# Now we have to place our code under git version control
#
# # initialize a new git repo
# $ git init
#
# # add the files to it that we want in our application to the staging area
# $ git add 5_calculator.rb
# $ git add config.ru
#
# # commit the staging area into the repository
# $ git commit -m "making our application"

# # now our git is set up, lets set up our heroku
# # if this is your first time making a heroku application, you may need to do a little more to identify yourself to heroku
# $ heroku create
#
# # so now heroku is a repote repo, we can just use git to push our code ot it
# $ git push heroku master
#
# # our code is now on heroku, lets open it up in our browser and take a look
# $ heroku open