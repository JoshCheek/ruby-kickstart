# Write a method named prime_chars? which takes array of strings
# and returns true if the sum of the characters is prime.
#
# Remember that a number is prime if the only integers that can divide it with no remainder are 1 and itself.
#
# Examples of length three
# prime_chars? ['abc']            # => true
# prime_chars? ['a', 'bc']        # => true
# prime_chars? ['ab', 'c']        # => true
# prime_chars? ['a', 'b', 'c']    # => true
#
# Examples of length four
# prime_chars? ['abcd']           # => false
# prime_chars? ['ab', 'cd']       # => false
# prime_chars? ['a', 'bcd']       # => false
# prime_chars? ['a', 'b', 'cd']   # => false

# Unsure why this needs to be a class
# Had written functioning code, but rake will only pass when it is my prime? function sits with a class called Integer
# Unsure why?
class Integer
  def prime?
    return false if self < 2
    2.upto Math.sqrt(self) do |i|
      return false if self % i == 0
    end
    true
  end
end

def prime_chars?(array)
  array.join.length.prime?
end
