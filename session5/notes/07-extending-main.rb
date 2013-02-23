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

