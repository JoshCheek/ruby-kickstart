# When we say "abc".length, the length method
# is stored in the String class.
length = String.instance_method 'length'
length # => #<UnboundMethod: String#length>


# So if we want to make a new method on strings,
# we would put it in the String class
class String
  def half_length
    length / 2
  end
end
"abcdef".half_length # => 3
