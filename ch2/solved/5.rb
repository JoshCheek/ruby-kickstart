def mod_three(numbers)
  numbers.select { |number| number % 3 != 0 }.map { |number| number % 3 }
end