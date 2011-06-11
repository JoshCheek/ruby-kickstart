def first_pos(str)
  to_return = {}
  str.split.each_with_index do |word, index|
    to_return[word] = index unless to_return[word]
  end
  to_return
end
