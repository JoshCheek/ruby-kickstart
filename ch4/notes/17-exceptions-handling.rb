# If you handle the exception, you may want to try again

numerator = 100
denominator = 0

begin
  result = numerator / denominator
rescue ZeroDivisionError => e
  denominator += 1
  retry
end

result        # => 100
denominator   # => 1

