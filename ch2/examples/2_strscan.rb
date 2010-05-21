require 'strscan'

# doesn't take an IO objec, but you could do 
# STDIN.read

s = StringScanner.new("Fri Dec 12 1975 14:39")


s.scan(/(\w+) (\w+) (\d+) /)       # => "Fri Dec 12 "

s[0]                               # => "Fri Dec 12 "
s[1]                               # => "Fri"
s[2]                               # => "Dec"
s[3]                               # => "12"

s.post_match                       # => "1975 14:39"
s.pre_match                        # => ""
