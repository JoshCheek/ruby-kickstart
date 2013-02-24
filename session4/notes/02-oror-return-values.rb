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
