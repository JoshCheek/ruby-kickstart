# There is a special object named nil
nil.class # => NilClass

# It's the object you use when you need to represent that you don't have an object!
array = [1,5,7]
array.find { |number| number * 2 == 10 } # => 5
array.find { |number| number * 2 == 11 } # => nil

