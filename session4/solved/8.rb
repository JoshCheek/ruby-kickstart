class RubyKickstartException < Exception
end

def exception_raiser(num)
  if num == 1
    raise "No 1s allowed!"
  elsif num == 2
    raise ArgumentError.new("No 2s allowed!")
  elsif num == 3
    raise Exception.new("No 3s allowed!")
  elsif num == 4
    raise SyntaxError.new("No 4s allowed!")
  elsif num == 5
    raise RubyKickstartException.new("No 5s allowed!")
  end
end
