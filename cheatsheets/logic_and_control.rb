# =====  Logical Operators  =====
a , b , c = 1 , 2 , 3
a == b && a == c          # logical and
a == b || a == c          # logical or

# less than, greater than
4 <  5  # => true
4 <  3  # => false

4 >  3  # => true
4 >  5  # => false

# less/greater than or equal to
4 <= 3  # => false
4 <= 4  # => true
4 <= 5  # => true

4 >= 3  # => true
4 >= 4  # => true
4 >= 5  # => false

# equal to
4 == 3  # => false
4 == 4  # => true

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


# =====  Loops  =====
ary = Array.new
5.times do |current|
  ary << current
end
ary # => [0, 1, 2, 3, 4]


ary = Array.new
1.step 10 , 2 do |current|
  ary << current
end
ary # => [1, 3, 5, 7, 9]



# =====  Skip this iteration / Stop iterating  =====
ary = Array.new
10.times do |current|
  next if current % 2 == 1
  ary << current
end
ary # => [0, 2, 4, 6, 8]


# break out of a loop
ary = Array.new
10.times do |current|
  break if current >= 5
  ary << current
end
ary # => [0, 1, 2, 3, 4]

