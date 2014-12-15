# You have already seen ordinal parameters, they have a name and
# are mandatory. But you can make them optional by giving them
# an equal sign, and listing a default value.
def same_case(str, upcase = true)
  return str.upcase if upcase
  str.downcase
end

same_case 'UPPER lower'          # => "UPPER LOWER"
same_case 'UPPER lower' , false  # => "upper lower"


# optional parameters must go to the right of ordinal parameters,
# and are filled in from the left
def what_are_filled_in(a=5, b=4, c=3, d=2, e=1)
  "#{a} #{b} #{c} #{d} #{e}"
end

what_are_filled_in                         # => "5 4 3 2 1"
what_are_filled_in :A                      # => "A 4 3 2 1"
what_are_filled_in :A , :B                 # => "A B 3 2 1"
what_are_filled_in :A , :B , :C            # => "A B C 2 1"
what_are_filled_in :A , :B , :C , :D       # => "A B C D 1"
what_are_filled_in :A , :B , :C , :D , :E  # => "A B C D E"

# what will this return?
what_are_filled_in :A ,                :E  # =>
