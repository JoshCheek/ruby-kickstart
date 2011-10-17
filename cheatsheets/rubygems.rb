# =====  What Are Gems?  =====
# In Ruby, third party libraries are called gems
# You can see a list of most of Ruby's gems at rubygems.org


# =====  How To Install  =====
# When you find one there that you are interested in, e.g. BlueCloth, a gem to parse markdown and output html
# http://rubygems.org/gems/bluecloth
# It will give you instructions on how to install it
# $ gem install bluecloth
#
# (note that if you are on OSX, and not using rvm, and haven't fixed your path, you may need to execute that with sudo)


# =====  What Happens When You Install?  =====
# When you install a gem, it, in turn, installs its dependencies
# So installing Sinatra will also install rack
# BlueCloth doesn't have any dependencies 

# It also builds code that is written in a language that needs to be compiled (namely C)
# So some libraries, like BlueCloth will require you to have a compiler available to use to compile the gem for your system

# It also builds documentation in the form of ri, and rdoc
# To use ri, go to the command line and type "$ ri topic", ie "$ ri String"
# To use the rdocs, you can load up your own documentation server


# =====  Documentation  =====
# To load up your own documentation Server
# $ gem server
#
# It will be hosted on some local port, probably 8808
# Go to http://localhost:8808
# Select the gem of interest, the docs are there (for example, my bluecloth is at)


# =====  Where Else To Look When Figuring Out How To Use It  =====
# I find a combination of resources helpful, docs are just one
#
# Looking through a gem's source code to see how they implement
# A given method, or how the magic works, can be very helpful
#
# To get there, you you can go to your gem directory, see this with
# $ gem environment
# 
# If you have gem-open ("$ gem install gem-open"), then you can open it directly with "$ gem open gemname"
# 
# If you just want to see it quickly, you can follow the link to the source host (probably github)
# If you want to experiment with it, you can git clone the source code into a directory on your machine
# Then you can play around without affecting your gems.
#
# A good example can also be very helpful, google + blogs can be your friend :)
# Oftentimes there are also examples in the code
#
# Looking at what things the authors taken the time to test can show you how they expected it to be used
# And what features and things they took the time to make sure work correctly
# Tests will either be in /spec or /test directories.
#
# For example, looking at the BlueCloth homepage I didn't see anything helpful.
# I loaded up the gem server, and felt unsure where the "overview" information was
# I looked at spec/bluecloth_spec.rb and saw the spec
# it "allows output to be rendered several times" do
#   bc = BlueCloth.new( "Some text" )
#   bc.to_html.should == bc.to_html
# end
#
# Oh, I guess we can just drop our markdown into the constructor, and call the instance method to_html (see me do it below)


# =====  Using Gems  =====
# Gems become available to you in your ruby files
# (On Ruby 1.8, you must require rubygems first.)
require 'bluecloth'

# now you are free to use it as you would any library, or even your own code
topics = BlueCloth.new <<CHAPTER_DESCRIPTION
* Arithmetic
* Logic
* Basic IO
* Arrays
CHAPTER_DESCRIPTION

topics.to_html # => "<ul>\n<li>Arithmetic</li>\n<li>Logic</li>\n<li>Basic IO</li>\n<li>Arrays</li>\n</ul>"


# =====  Executables  =====
# Some gems have executables, if your rubygems are set up properly, they will be made available
# BlueCloth, for example, has an executable. You can go see its source code in BlueCloth's bin directory
# Here is an example of how to invoke it
# $ bluecloth ~/code/JoshsRubyKickstart/README.mdown 
