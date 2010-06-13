# An ugly solution IMO (you can make it much prettier on 1.9)
# take the indexes we care about stars. the char at that index is either not a star and therefore valid
# or it is a star, in which case we are only interested in whether the elements around it are stars
def same_star_char(str)
  ( 1 ... str.length-1 ).all? do |i|
    str[i,1] != '*' || ( str[i,1] == '*' && str[i-1,1] == str[i+1,1] )
  end
end


# split it into an array of chars
# then get each set of three consecutive elements
# check that if the middle is a star, the ends are the same
def same_star_char(str)
  str.split(//).each_cons 3 do |a,b,c|
    next unless b == '*'
    return false unless a == c
  end
  true
end


# A regex solution:
# Capture the character before the star
# If the character after the star is not the same as the one before it 
# (and is not the end of the String -- necessary, b/c (?!) is zero width)
# Then we have a match.
#
# This is what we do not want to find, so return true only if we don't find any
# of the matches we don't want
def same_star_char(str)
  str !~ /(.)\*(?!\1|$)/
end
