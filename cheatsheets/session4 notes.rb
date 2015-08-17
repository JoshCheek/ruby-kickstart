#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/01-andand-return-values.rb file content is listed below
###############################################################################

# Remember, everything in Ruby is true except for false and nil.
# This means that (1 && 5) returning 5 works just as well
# as if it had returned true. And in fact, that's what it does
# && returns the last object it looks at before making its decision.

# The LHS is true, so always returns the RHS.
1 && 5        # => 5
1 && nil      # => nil
1 && false    # => false
1 && true     # => true
1 && 'abc'    # => "abc"

# The LHS is false, so just returns the LHS
nil   && 1    # => nil
false && 1    # => false

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/02-oror-return-values.rb file content is listed below
###############################################################################

# The same short circuit principle applies to ||.



# When the LHS is true, returns the LHS
1     || nil      # => 1
"abc" || false    # => "abc"



# When the LHS is false, returns the LHS
nil   || 1        # => 1
false || "abc"    # => "abc"



# How could this be used? The Sinatra gem, a web "microframework"
# uses it to find the current mime type, or if there isn't one,
# then use the default (http://goo.gl/cVDMK)
mime_type = mime_type(type) || default

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/03-ororequals.rb file content is listed below
###############################################################################

# A common idiom is to use the conditional or values to only set
# a variable if it hasn't been set yet. Remember that `a += b`
# expands to `a = a + b`, well `a ||= b` expands to `a = (a || b)`
# When it has been set, it returns the value of a. When it hasn't
# been set, it is nil, so returns the value of b.


# Here is an example, I am using this in ruby-kickstart.com
# (http://goo.gl/21tEg) I have regular expressions that match
# against your answers, but databases don't know what regular
# expressions are, so I have to convert them into a text format
# called YAML. Then when I want to use them, I convert them out
# of YAML back into a regular expression.
#
# In order to not incure the cost of converting from YAML
# every time I want to use the regex, I only do it the first
# time by using ||=
class QuizRegex < ActiveRecord::Base
  belongs_to :quiz_match_answer_problem

  def regex=(regex)
    @regex = regex
    self.content = YAML.dump regex
  end

  def regex
    @regex ||= YAML.load(content)
  end
end

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/04-introspection.rb file content is listed below
###############################################################################

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

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/05-ranges.rb file content is listed below
###############################################################################

# ranges look like this
1..5            # => 1..5
1...5           # => 1...5

# 2 dots includes the end
(1..3).to_a     # => [1, 2, 3]

# 3 dots excludes the end
(1...3).to_a    # => [1, 2]



# They are iterable, using the methods in by Enumerable module
iterated = Array.new
(1..5).each { |n| iterated << n }
iterated                            # => [1, 2, 3, 4, 5]

(1...5).map { |n| n * 5 }           # => [5, 10, 15, 20]
('a'..'c').to_a                     # => ["a", "b", "c"]


# They make good arguments to things like arrays
[1,2,3,4,5][1..3]                   # => [2, 3, 4]


# You can use variables also
start = 10
stop  = 15
start..stop                         # => 10..15


# They're mostly useless, but you'll see them every now and
# then, so just be aware of what they are.

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/06-files.rb file content is listed below
###############################################################################

# docs: http://ruby-doc.org/core/classes/File.html
#       http://ruby-doc.org/core/classes/IO.html
#
#
# File output basically works the same way as regular output,
# because a File object is an IO object
# and $stdout and $stdin, are also IO objects.


# Note that by default, this all happens in the dir
# *you're* in, not the dir that the *file* is in.


# Write to a file
File.open "names", "w" do |file|
  file.puts  "sally"
  file.puts  "sam"
  file.print "billy"
  file.print "bob"
  file.puts
end


# You can see it's in here.
files = Dir.glob('*')  # => ["01-&&-return-values.rb", "02-||-return-values.rb", "03-||=.rb", "04-introspection.rb", "05-ranges.rb", "06-files.rb", "names", "notes.rb"]
files.include? 'names' # => true


# Read the entire file at once
contents = File.read "names"
contents  # => "sally\nsam\nbillybob\n"


# Iterate over the lines of the file
# useful if your file is really big.
File.foreach "names" do |line|
  line  # => "sally\n", "sam\n", "billybob\n"
end


# Read each line from the file into an array
File.readlines "names" # => ["sally\n", "sam\n", "billybob\n"]


# Cleaning up
File.exist? "names" # => true
File.delete "names"
File.exist? "names" # => false

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/07-working-dir-vs-file-dir.rb file content is listed below
###############################################################################

# The working directory is the directory you're in when you invoke
# the Ruby program. Use Dir.pwd (print working directory) to find it.
puts "Your working directory is #{Dir.pwd}"


# The file's dir, however, is where the file is stored in. Every
# file has a variable it can access called __FILE__ which tells
# it where it is located. You can get the file's directory
# with File.dirname(__FILE__). The "." means "current dir",
# in other words, the file is located in the same dir as we are.
# The ".." means the parent dir, the one containing the
# current dir.
puts "This script is located in #{File.dirname __FILE__}"


# Try going to different directories and invoking this script:

# --- From the RKS root ---
# $ ruby ch4/notes/07-working-dir-vs-file-dir.rb
# Your working directory is /Users/josh/code/RKS
# This script is located in ch4/notes

# --- From ch3 ---
# $ ruby ../ch4/notes/07-working-dir-vs-file-dir.rb
# Your working directory is /Users/josh/code/RKS/ch3
# This script is located in ../ch4/notes

# --- From ch4/notes ---
# $ ruby 07-working-dir-vs-file-dir.rb
# Your working directory is /Users/josh/code/RKS/ch4/notes
# This script is located in .

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/08.a-require.rb file content is listed below
###############################################################################

# When you have code in one file that you want to use in another
# file, you load it by using require.
defined? Date # => nil
require 'date'
defined? Date # => "constant"

# In this case, Ruby looks in several different places to see a
# list of locations to look for the file you required. It contains
# things like the standard library, a set of files with useful
# things like Date.

# When you want to load a file that you've written, it won't be
# in that path variable, so you must give Ruby an absolute path
# to the file.
require File.dirname(__FILE__) + '/08.b-require'

def here
  'from 08.a'
end

here    # => "from 08.a"
there   # => "from 08.b"

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/08.b-require.rb file content is listed below
###############################################################################

# This code will be required by 08.a

def there
  'from 08.b'
end

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/09-inheritance-introduction.rb file content is listed below
###############################################################################

# Sometimes you have a generic idea of your class, but it can be
# realized in several specific ways. Sometimes, in Object Oriented
# Programming, we will subclass the generic class, called the
# superclass, and write more specific implementations. (Note that
# this has largely fallen out of favour in the Ruby community).

class Superclass
end

# Use the < to indicate inheritance
class Subclass < Superclass
end

Subclass.superclass # => Superclass


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/10-subclasses-inherit-methods.rb file content is listed below
###############################################################################

class Superclass
  def self.class_method
    'class_method from Superclass'
  end

  def instance_method
    'instance_method from Superclass'
  end
end

class Subclass < Superclass
end

# Subclasses inherit methods from their superclass
Subclass.class_method         # => "class_method from Superclass"
Subclass.new.instance_method  # => "instance_method from Superclass"


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/11-overriding-inherited-methods.rb file content is listed below
###############################################################################

class Superclass
  def self.class_method
    'class_method from Superclass'
  end

  def instance_method
    'instance_method from Superclass'
  end
end

class Subclass < Superclass
  def self.class_method
    'class_method from Subclass'
  end
end

Subclass.class_method         # => "class_method from Subclass"
Subclass.new.instance_method  # => "instance_method from Superclass"


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/12-super-to-invoke-inherited.rb file content is listed below
###############################################################################

# When you override a method, you can call the method
# you're overriding, with the keyword `super`.
class Superclass
  def self.class_method
    'class_method from Superclass'
  end
end

class Subclass < Superclass
  def self.class_method
    super + " | through Subclass"
  end
end

Subclass.class_method # => "class_method from Superclass | through Subclass"


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/13-inheritance-example.rb file content is listed below
###############################################################################

# This will be our superclass. There are many kinds of employees but
# they all have wages, and each type makes a certain dollars per hour.
class Employee
  class << self
    attr_accessor :dollars_per_hour
  end

  attr_accessor :hours_worked

  def initialize( hours_worked )
    self.hours_worked = hours_worked
  end

  def wages
    self.class.dollars_per_hour * hours_worked
  end
end


# Bill is a clerk, he makes 160 hours * $20 per hour = $3200
class Clerk < Employee
  self.dollars_per_hour = 20
end
bill = Clerk.new 160
bill.wages  # => 3200


# Ayaan is an engineer, she makes
# 160 hours * $30 per hour + $500 per month = $5300
class Engineer < Employee
  self.dollars_per_hour = 30
  def wages
    super + 500
  end
end
ayaan = Engineer.new 160
ayaan.wages # => 5300

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/14-ancestors.rb file content is listed below
###############################################################################

# The chain of superclasses are called ancestors.
class Superclass
end

class Subclass < Superclass
end

Subclass.ancestors      # => [Subclass, Superclass, Object, Kernel, BasicObject]
Subclass                # => Subclass
Subclass.superclass     # => Superclass
Superclass.superclass   # => Object
Object.superclass       # => BasicObject
BasicObject.superclass  # => nil

# Kernel doesn't fit in, that's because it's not a class,
# it's a module. We'll talk about modules next time.

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/15-exceptions-introduction.rb file content is listed below
###############################################################################

# Errors and Exceptions are used to say "something something happend
# that I don't know how to deal with". They halt evaluation, and
# return to where they were called from, incrementally making their
# way up the stack (the series of methods that were called to get to
# wherever the exception was raised) until they are either either
# rescued, or cause the program to crash.

# You raise exceptions with the raise method
raise "This will now die!"
# ~> -:9:in `<main>': This will now die! (RuntimeError)

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/16-exceptions-rescuing.rb file content is listed below
###############################################################################

def method_with_one_parameter(n)
end


# Code that might raise an error goes in begin/rescue/end blocks.
begin
  method_with_one_parameter(1,2,3)
  # This code won't be executed because it happened after the exception.
  1 + 2             # =>
rescue ArgumentError => e
  # We've rescued the Error, and are storing it in
  # the variable e. Errors are objects just like anything else.
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


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session4/notes/17-raising-your-own.rb file content is listed below
###############################################################################

# You can raise an existing exception by passing it to raise
begin
  raise Exception.new("We made this!")
rescue Exception => e
  e # => #<Exception: We made this!>
end


# If you pass a string to raise, it will be a RuntimeError
begin
  raise "Fix your shit"
rescue RuntimeError => e
  e # => #<RuntimeError: Fix your shit>
end

################################## -- END -- ##################################



