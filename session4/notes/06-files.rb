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
