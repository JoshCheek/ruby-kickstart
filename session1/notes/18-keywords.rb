# We care about keywords, because they have special meaning to Ruby.
# This means that we can't use them as variable names.
#
# You will know if you've used one, because the interpreter will
# If your text editor highlights it, don't use it. :)
#
# If you _really_ want a list, its at http://www.google.com/search?&q=ruby+keywords+list




# def is a keyword used for defining methods. It has special meaning, you can't use it.

def = 3 # !> useless use of a literal in void context
# ~> -:14: syntax error, unexpected '='
# ~> def = 3 # !> useless use of a literal in void context
# ~>      ^

