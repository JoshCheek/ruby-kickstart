def sum_digits(str)
  str.                                        # the dot here indicates that I am invoking a method. I'm placing each method on its own line so I can comment
  split(//).                                  # split into an array of characters
  select { |char| ('1'..'9').include? char }. # select the characters who are in the range '1'..'9' (ie digits)
  inject(0) { |sum,char| sum + char.to_i }    # sum them up (this is the same as your passthrough method from problem 2)
end