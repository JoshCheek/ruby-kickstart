# Write a method, match_maker, which will receive an unknown number of
# elements, and return an array where every two elements are represented by true or false.
#
# The very first parameter will not be part of this set. Instead, it will tell
# you how to determine what their value should be.
# If it is true, then they will be true when they are oppositely truthy.
# If it is false, then they will be true when they are similarly truthy.
#
# Examples:
# match_maker false, true,  true                # => [true]
# match_maker true,  true,  true                # => [false]
# match_maker true,  false, false               # => [false]
# match_maker true,  false, true                # => [true]
# match_maker true,  true,  false               # => [true]
# match_maker true,  true,  true, false, true   # => [false, true]
# match_maker true,  true,  true, false, nil    # => [false, false]
# match_maker true,  true,  true, true, nil     # => [false, true]
# match_maker true,  true,  true, 0, nil        # => [false, true]

# New definition that takes a boolean parameter and a parameter that takes an unknown amount of parameters '*'
def match_maker(determine, *elements)
  # Create a new array
  return_array = []
  # Loop through each item in the elements array, slicing into two
  elements.each_slice 2 do | first, last |
    # Create a variable that checks if the element is the opposite
    first = !!first
    last = !!last
    result = determine ? first != last : first == last
  # Push the result to the array
  return_array << result
  end
  # Return the array
  return_array
end

match_maker true,  true,  true, 0, nil
