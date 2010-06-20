# modified version of Ryan Davis' cheatsheet at http://www.zenspider.com/Languages/Ruby/QuickRef.html#11

# =====  Quickreference  =====
# .             any character except newline
# [ ]           any single character of set
# [^ ]          any single character NOT of set
# *             0 or more previous regular expression
# *?            0 or more previous regular expression (non-greedy)
# +             1 or more previous regular expression
# +?            1 or more previous regular expression (non-greedy)
# ?             0 or 1 previous regular expression
# |             alternation
# ( )           grouping regular expressions
# ^             beginning of a line or string
# $             end of a line or string
# {m,n}         at least m but most n previous regular expression
# {m,n}?        at least m but most n previous regular expression (non-greedy)
# \1-9          nth previous captured group
# \&            whole match
# \`            pre-match
# \'            post-match
# \+            highest group matched
# \A            beginning of a string
# \b            backspace(0x08)(inside[]only)
# \b            word boundary(outside[]only)
# \B            non-word boundary
# \d            digit, same as[0-9]
# \D            non-digit
# \S            non-whitespace character
# \s            whitespace character[ \t\n\r\f]
# \W            non-word character
# \w            word character[0-9A-Za-z_]
# \z            end of a string
# \Z            end of a string, or before newline at the end
# (?#)          comment
# (?:)          grouping without backreferences
# (?=)          zero-width positive look-ahead assertion
# (?!)          zero-width negative look-ahead assertion
# (?>)          nested anchored sub-regexp. stops backtracking.
# (?imx-imx)    turns on/off imx options for rest of regexp.
# (?imx-imx:re) turns on/off imx options, localized in group.



# =====  Constructing  =====

# to create a regex, just surround it with slashes
/regex/       # => /regex/
/regex/.class # => Regexp


# if you have a bunch of / in your regex, you would have to escape them, so that they don't look like the end of the regex
# so you can also create a regex with %r followed by a delimiter (just like %w for Arrays of Strings)
%r(regex)     # => /regex/
%r[regex]     # => /regex/
%r{regex}     # => /regex/
%r(/usr/bin)  # => /\/usr\/bin/

# you can also interpolate
str = "ege"
/r#{str}x/    # => /regex/



# =====  Ways to Use Regex (simple)  =====
str = "This is a cheatsheet for regular expressions."

# get the index of a match
str =~ /h../ # => 1
str =~ /q../ # => nil

# get the content of a match
str[/h../]  # => "his"
str[/q../]  # => nil

# substitute the first match with sub, and every match with gsub (the g means to apply the regex "globally" to the String -- g is a flag in some other languages)
str = "bobbling babbling bubbles"
str.sub(  /b.b/ , "--replacement--" )       # => "--replacement--bling babbling bubbles"
str.gsub( /b.b/ , "--replacement--" )       # => "--replacement--bling --replacement--bling --replacement--bles"
str.gsub( /b.b/ ) { |match| match.upcase }  # => "BOBbling BABbling BUBbles"

# find all occurrences of a match
str.scan(/b.b/)   # => ["bob", "bab", "bub"]

# use the match as a delimiter, and find everything inbetween
str.split(/b.b/)  # => ["", "bling ", "bling ", "bles"]

# These don't directly work on Symbols, but if you invoke the grep method on an Array
# it will convert them to Symbols before checking your regular expression
# This will go through each element, and if the regex matches it, that element will be in the return array
words = %w(Oh, oh, oh, finding the answer. Oh, oh, oh, oh, oh. Finding that there ain't no answer to find.)
words.grep(/e/) # => ["the", "answer.", "there", "answer"]



# =====  Flags  =====
# You can append a flag to the end of a regex to alter its behaviour
# /i         case insensitive
# /o         only interpolate #{} blocks once
# /m         multiline mode - '.' will match newline
# /x         extended mode - whitespace is ignored
# /[neus]    encoding: none, EUC, UTF-8, SJIS, respectively

"BOBble bobble".scan(/b.b/)  # => ["bob"]
"BOBble bobble".scan(/b.b/i) # => ["BOB", "bob"]

str = "bobble\nbubble\nbabble"
str[/e.b/]  # => nil
str[/e.b/m] # => "e\nb"



# =====  Matching Characters  =====
# Any character by itself will match that character
"abc"[/a/]  # => "a"
"abc"[/ab/] # => "ab"
"abc"[/ac/] # => nil
"abc"[/A/]  # => nil
"abc"[/A/i] # => "a"

# A dot will match any character except newline
"ab\ncd".scan(/./) # => ["a", "b", "c", "d"]

# Brackets are how you define a set of characters that are allowed to match one particular character
str = "bobble bubble babble"
str.scan(/b.b/)     # => ["bob", "bub", "bab"]
str.scan(/b[oa]b/)  # => ["bob", "bab"]

# you can also give ranges when inside of brackets by specifying a start and end character
# this is the same as /b[abcdefghijklmnopqrst]b/
str.scan(/b[a-t]b/)                                                 # => ["bob", "bab"]
# this is the same as /b[abcnop]b/
str.scan(/b[a-cn-p]b/)                                              # => ["bob", "bab"]
alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
alphabet.scan(/[a-cmnoy-z]/)                                        # => ["a", "b", "c", "m", "n", "o", "y", "z"]


# To match anything NOT in the set, put a caret at the beginning of the brackets
str.scan(/b[^o]b/) # => ["bub", "bab"]



# =====  Named Sets  =====
# \d digit, same as[0-9]
# \D non-digit
# \S non-whitespace character
# \s whitespace character[ \t\n\r\f]
# \W non-word character
# \w word character[0-9A-Za-z_]



# =====  Quantifiers  =====
# To continue to match 0 or more previous regular expression, use a spat
# in this case, we will match digits that occur in series of 0 or more, if they follow the text MX
# notice that they are greedy, they try to match as much number as they can
str = "The product tags are plain MX, MX104, MX952, and MX7511."
str.scan(/MX[1-9]*/) # => ["MX", "MX1", "MX952", "MX7511"]

# the plus does the same thing as the splat, but matches 1 or more insetad of 0 or more
str.scan(/MX[1-9]+/) # => ["MX1", "MX952", "MX7511"]

# to make them non greedy, so that they match as little as they can instead of as much as they can, put a question mark after them
str = "Then I said 'Oh no' and he said 'oh yes!', can you believe it?"
str[/'.*'/]   # => "'Oh no' and he said 'oh yes!'"
str[/'.*?'/]  # => "'Oh no'"

# Use a question mark to match 0 or 1 time
str = "The product tags are plain MX, MX104, MX952, and MX7511."
str.scan(/MX[0-9]?/) # => ["MX", "MX1", "MX9", "MX7"]

# specify a minimum and maximum number of times to look for whatever is to the left by using curly braces
numbers = "1 12 123 1234 12345 123456 1234567 12345678 123456789 1234567890"
numbers.scan(/\d{4,8}/) # => ["1234", "12345", "123456", "1234567", "12345678", "12345678", "12345678"]
# Whoops, things are a little tricky! That isn't what I meant to match at all, it is matching the "1245678" out of things like "1234567890"
numbers.scan(/\b\d{4,8}\b/) # => ["1234", "12345", "123456", "1234567", "12345678"]



# =====  Logic, Grouping And Control  =====
# use a single pipe to express alternation (this one or that one)
str = "I'm planning a trip to the moon, and then from there to venus, and from there to the center of milky way!"
str.scan(/moon|venus|milky way/) # => ["moon", "venus", "milky way"]

# you can group things together with parentheses
str = "I rode a sunbeam from the sunburst on Sunday."
str.gsub(/sun(beam|burst|day)/i) { |match| match.upcase } # => "I rode a SUNBEAM from the SUNBURST on SUNDAY."

# Parentheses capture whatever is matched inside of them. You can access the capture in Ruby with the variables $1 - $9
str = "location: France, language: French, name: Aimée"
str =~ /location: (\w+), language: (\w+), name: (\w+)/
$1  # => "France"
$2  # => "French"
$3  # => "Aimée"
$4  # => nil

# When you need to refer back to a capture group in a String, you can use \1 through \9
str = "I rode a sunbeam from the sunburst on Monday."
str.gsub( /(sun|mon)(beam|burst|day)/i , '(\1)(\2)' ) # => "I rode a (sun)(beam) from the (sun)(burst) on (Mon)(day)."
# warning, double quoted strings will require you to escape the slash in front of 1 and 2:
'(\1)(\2)'    # => "(\\1)(\\2)"
"(\\1)(\\2)"  # => "(\\1)(\\2)"

# If you don't want the group to capture, place ?: at the front of it. Now, the second group is the first capture group.
str = "I rode a sunbeam from the sunburst on Monday."
str.gsub( /(?:sun|mon)(beam|burst|day)/i , '(\1)(\2)' ) # => "I rode a (beam)() from the (burst)() on (day)()."

# If you want to conditionally match, if you see something ahead (in 1.9, you can also match behind)
# then use (?=) and if you want to match if you do not see something ahead, use (?!)
# NOTE THAT THESE DO NOT TAKE UP ANY WIDTH IN THE MATCH
str = "This is the firstday of the secondstone of the month."
str.scan(/(?:first|second)(?:stone|day)/) # => ["firstday", "secondstone"]
str.scan(/(?:first|second)(?=stone)/) # => ["second"]
str.scan(/(?:first|second)(?!stone)/) # => ["first"]



# =====  Zero Width Matchers  =====
# caret to match the beginning of a line, and dollar sign to match end of a line
# note that in this example, we don't need multiline because the match itself is not going across multiple lines
str = "Hello my\ndarling how\nare you?"
str.scan(/^./)      # => ["H", "d", "a"]
str.scan(/.$/)      # => ["y", "w", "?"]
str.scan(/.$.^./)   # => []
str.scan(/.$.^./m)  # => ["y\nd", "w\na"]

# \A and \Z are just like ^ and $, but they match the beginning and end of the entire string, rather than just the line
str.scan(/\A./)     # => ["H"]
str.scan(/.\Z/)     # => ["?"]

# to match the break between a word and nonword boundry, use \b
str.scan(/\w\b/) # => ["o", "y", "g", "w", "e", "u"]
str.scan(/\b\w/) # => ["H", "m", "d", "h", "a", "y"]
