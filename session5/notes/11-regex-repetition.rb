# * to match zero or more
"aabc"[/x*/]                # => ""
"aabc"[/a*/]                # => "aa"

# + to match one or more
"aabc"[/x+/]                # => nil
"aabc"[/a+/]                # => "aa"

# ? to match 0 or 1
"abcde abde".scan(/bc?d/)   # => ["bcd", "bd"]
