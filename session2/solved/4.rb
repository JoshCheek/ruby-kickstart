def get_squares(numbers)
  numbers.select do |number|
    numbers.include? number**2
  end.sort
end