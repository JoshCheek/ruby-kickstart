# You can logically group multiple characters with parentheses
# Each will be captured according in variables $1, $2, ...
regex = /(.).(.).(.)/
"abcde" =~ regex
$1                                        # => "a"
$2                                        # => "c"
$3                                        # => "e"


# A pipe acts as an "or"
regex = /big (dog|boy)/

"I bought a big truck today"[regex]       # => nil

"He is a big boy now."[regex]             # => "big boy"
$1                                        # => "boy"

"That is one big dog over there."[regex]  # => "big dog"
$1                                        # => "dog"

