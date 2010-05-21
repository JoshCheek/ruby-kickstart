require 'strscan'

p DATA.gets
s = StringScanner.new(DATA.gets)


s.scan(/(\w+) (\w+) (\d+) /)       # => nil

s[0]                               # => nil
s[1]                               # => nil
s[2]                               # => nil
s[3]                               # => nil

s.post_match                       # => nil
s.pre_match                        # => nil

__END__
"Fri Dec 12 1975 14:39"
