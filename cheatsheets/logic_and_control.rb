# =====  Logical Operators  =====
a , b , c = 1 , 2 , 3
a == b && a == c          # logical and
a == b || a == c          # logical or
a == b ^ a == c           # logical exclusive or


# =====  General syntax of an if statement  =====
def one_two_or_three(n)
  if n == 1
    return 'one'
  elsif n == 2
    return 'two'
  else
    return 'three'
  end
end

one_two_or_three 1 # => "one"
one_two_or_three 2 # => "two"
one_two_or_three 3 # => "three"


# =====  Ternary / inline  =====
    1 == 1  ?     'one'  :     'five'        # => "one"
    1 == 5  ?     'one'  :     'five'        # => "five"
if  1 == 1  then  'one'  else  'five'  end   # => "one"
if  1 == 5  then  'one'  else  'five'  end   # => "five"


# =====  Single line  =====
result = 'set'
result = 'modified once' if 1 == 1
result                                    # => "modified once"
result = 'modified twice' if 1 != 1
result                                    # => "modified once"


# =====  ! to negate  =====
result = 'set'
result = 'modified once' if !false
result                                    # => "modified once"
result = 'modified twice' if !true
result                                    # => "modified once"


# =====  False and nil are false, everything else is true  =====
!!false           # => false
!!true            # => true
!!nil             # => false
!!Array.new       # => true
!!String.new      # => true
!!Regexp.new('')  # => true


# =====  Unless  =====
result = 'set'
result = 'modified once' unless 1 == 2
result                                    # => "modified once"
result = 'modified twice' unless 1 == 1
result                                    # => "modified once"


# =====  While  =====
i = 0
ary = Array.new
while i < 5
  ary << i
  i += 1
end
ary # => [0, 1, 2, 3, 4]


# =====  Until  =====
i = 10
ary = Array.new
until i > 14
  ary << i
  i += 1
end
ary # => [10, 11, 12, 13, 14]


# =====  Loops  =====
ary = Array.new
5.times do |i|
  ary << i
end
ary # => [0, 1, 2, 3, 4]


ary = Array.new
for i in 10..14
  ary << i
end
ary # => [10, 11, 12, 13, 14]


ary = Array.new
5.upto 10 do |i|
  ary << i
end
ary # => [5, 6, 7, 8, 9, 10]


ary = Array.new
10.downto 5 do |i|
  ary << i
end
ary # => [10, 9, 8, 7, 6, 5]


ary = Array.new
1.step 10 , 2 do |i|
  ary << i
end
ary # => [1, 3, 5, 7, 9]



# =====  Java's continue is called next in Ruby  =====
ary = Array.new
10.times do |i|
  next if i % 2 == 1
  ary << i
end
ary # => [0, 2, 4, 6, 8]


# break out of a loop
ary = Array.new
10.times do |i|
  break if i >= 5
  ary << i
end
ary # => [0, 1, 2, 3, 4]

