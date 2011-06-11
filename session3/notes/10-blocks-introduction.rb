# Blocks are what we call a proc when we pass it into a method.
# They are defined with "{ }" or "do end"
ary = [3,2,1]               # => [3, 2, 1]

ary.map! { |num| num * 2 }
ary                         # => [6, 4, 2]

ary.map! do |num|
  num * 2
end
ary                         # => [12, 8, 4]

