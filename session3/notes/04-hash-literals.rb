# Where Arrays are represented with brackets,
# Hashes are represented in curly braces
[].class # => Array
{}.class # => Hash


# Keys are separated from their values with a hash rocket =>
# with the key on the left, and the value on the right
{0 => 'first', 1 => 'second'}  # => {0=>"first", 1=>"second"}

key   = :one
value = "two"
{key => value} # => {:one=>"two"}
