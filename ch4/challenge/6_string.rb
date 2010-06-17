# We'll say that a "triple" in a string is a char appearing three times in a row. Return the number of triples in the given string. The triples may overlap. 
# 
# count_triple("abcXXXabc")       # => 1
# count_triple("xxxabyyyycd")     # => 3
# count_triple("a")               # => 0
# count_triple("")                # => 0
# count_triple("XXXabc")          # => 1
# count_triple("XXXXabc")         # => 2
# count_triple("XXXXXabc")        # => 3
# count_triple("222abyyycdXXX")   # => 3
# count_triple("abYYYabXXXXXab")  # => 4
# count_triple("abYYXabXXYXXab")  # => 0
# count_triple("abYYXabXXYXXab")  # => 0
# count_triple("122abhhh2")       # => 1


def count_triple(string)
  count = 0
  string.each_char.each_cons 3 do |previous_char, current_char, next_char|
    count += 1 if previous_char == current_char && current_char == next_char
  end
  count
end