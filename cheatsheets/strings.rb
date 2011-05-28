# This should get you started. 
# But to see all the cool things you can do, check out the documentation
# 
# http://ruby-doc.org/core/classes/String.html


# Make a new string
"Can interpolate #{1+1}"      # => "Can interpolate 2"
'Cannot interpolate #{1+1}'   # => "Cannot interpolate \#{1+1}"

string = <<END_OF_DOC.upcase
  This is a here document, I can interpolate #{1}
  It will continue until it finds, the line END_OF_DOC by itself.
  Notice I can continue doing things on the line the here document is defined in.
  here I called String#upcase on it.
END_OF_DOC

string  # => "  THIS IS A HERE DOCUMENT, I CAN INTERPOLATE 1\n  IT WILL CONTINUE UNTIL IT FINDS, THE LINE END_OF_DOC BY ITSELF.\n  NOTICE I CAN CONTINUE DOING THINGS ON THE LINE THE HERE DOCUMENT IS DEFINED IN.\n  HERE I CALLED STRING#UPCASE ON IT.\n"


# Useful methods
'abc'.length        # => 3
'abc' == 'abc'      # => true
'abc' == 'def'      # => false
'AbCd'.downcase     # => "abcd"
'AbCd'.upcase       # => "ABCD"
" abc   ".strip     # => "abc"

# concatenation
'hello' + 'world'   # => "helloworld"
'hello' << 'world'  # => "helloworld"
# wait O.o why two methods for this?
s = "abc"
s + "def"       # => "abcdef"
s               # => "abc"
s << "def"      # => "abcdef"
s               # => "abcdef"

# Access parts of the string (-1 counts backwards from the end)
"abc"[-1]           # => "c"
"abc"[0]            # => "a"
"abc"[1]            # => "b"
"abc"[2]            # => "c"
"abc"[3]            # => nil
"abcdefg"[2..4]     # => "cde"
"abcdefg"[4..-1]    # => "efg"

# Changing parts of a string
message = "Josh said"
message["Josh"] = "dom"
message             # => "dom said"
message += ' "Howdy"'
message             # => "dom said \"Howdy\""
message.capitalize  # => "Dom said \"howdy\""
message             # => "dom said \"Howdy\""
message[-2] = 'e'
message             # => "dom said \"Howde\""
message[-2] = 'y!'
message             # => "dom said \"Howdy!\""

# Other useful methods (some of these use regular expressions, we'll talk about them more later)
"abc" * 3                                     # => "abcabcabc"
" abc \n".chomp                               # => " abc "
'trite'.gsub('t','b')                         # => "bribe"
"Their IDs are 11, and 492".scan(/\d+/)       # => ["11", "492"]
"Jack and Jill ran up the hill".split         # => ["Jack", "and", "Jill", "ran", "up", "the", "hill"]
"/usr/bin:/opt/local:/Users/josh".split(':')  # => ["/usr/bin", "/opt/local", "/Users/josh"]
"abcdefg hi".split(//)                        # => ["a", "b", "c", "d", "e", "f", "g", " ", "h", "i"]

