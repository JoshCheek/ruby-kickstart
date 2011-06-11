def passthrough( enumerable , to_pass )
  enumerable.each do |element| 
    to_pass = yield to_pass , element
  end
  to_pass
end