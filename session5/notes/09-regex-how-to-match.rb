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

