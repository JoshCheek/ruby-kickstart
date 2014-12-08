def line_sums(filename)
  File.readlines(filename).inject 0 do |sum, line|
    numbers = line.split.map { |number| number.to_i }
    sum + numbers.max
  end
end
