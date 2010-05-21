def alt_pairs(str)
  # note that in Ruby 1.9 you can just say str[i] instead of str[i..i]
  to_return = ''
  
  str.length.times do |i|
    to_return << str[i..i] if i / 2 % 2 == 0
  end

  return to_return
end
