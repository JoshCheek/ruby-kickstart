# Anywhere you can write code in Ruby returns a value, including if statements.

result = if true
  "yep, it's true"
else
  "nope, it's not true"
end

result # => "yep, it's true"



# Lets put that in a method
def if_returns_value(bool)
  if bool
    "yep it's true"
  else
    "nope, it's not true"
  end
end

if_returns_value true     # => "yep it's true"
if_returns_value false    # => "nope, it's not true"



# So does unless
def unless_returns_value(bool)
  unless bool
    "nope, it's not true"
  else
    "yep, it's true"
  end
end

unless_returns_value true   # => "yep, it's true"
unless_returns_value false  # => "nope, it's not true"

