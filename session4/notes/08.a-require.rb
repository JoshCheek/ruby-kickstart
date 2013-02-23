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
