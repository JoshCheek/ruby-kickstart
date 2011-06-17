# Any alphanumeric character will match itself.
"abc"[/b/]                                # => "b"


# Use brackets to declare a set of characters to match
# Match any character not in the set by leading it with a caret.
"proud pink pandas".scan(/p[aeiou]/)      # => ["pi", "pa"]
"proud pink pandas".scan(/p[^aeiou]/)     # => ["pr"]


# The dot will match any character except newlines.
"proud pink pandas".scan(/pr/)            # => ["pr"]
"proud pink pandas".scan(/pi/)            # => ["pi"]
"proud pink pandas".scan(/pa/)            # => ["pa"]
"proud pink pandas".scan(/p./)            # => ["pr", "pi", "pa"]


# You can give character ranges inside of brackets.
alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
alphabet.scan(/[a-cmnoy-z]/)              # => ["a", "b", "c", "m", "n", "o", "y", "z"]
