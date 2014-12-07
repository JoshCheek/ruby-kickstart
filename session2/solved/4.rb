def get_squares(numbers)
  numbers.select { |n| numbers.include? n*n }.sort
end
