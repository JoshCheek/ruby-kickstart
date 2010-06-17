# Write a function that returns true if for every '*' (star) in the string, 
# if there are chars both immediately before and after the star, they are the same.
# 
# same_star_char("xy*yzz")      # => true
# same_star_char("xy*zzz")      # => false
# same_star_char("*xa*az")      # => true
# same_star_char("*xa*bz")      # => false
# same_star_char("*xa*a*")      # => true
# same_star_char("")            # => true
# same_star_char("*xa*a*a")     # => true
# same_star_char("*xa*a*b")     # => false
# same_star_char("*12*2*2")     # => true
# same_star_char("12*2*3*")     # => false
# same_star_char("abcDEF")      # => true
# same_star_char("XY*YYYY*Z*")  # => false
# same_star_char("XY*YYYY*Y*")  # => true
# same_star_char("12*2*3*")     # => false
# same_star_char("*")           # => true
# same_star_char("**")          # => true

def same_star_char(string)
  string.each_char.each_cons 3 do |previous_char, current_char, next_char|
    return false if current_char == '*' && previous_char != next_char
  end
  true
end
