def match_maker(should_xor, *elements)
  to_return = []
  elements.each_slice 2 do |first, last|
    first = !!first
    last  = !!last
    result = if should_xor then first != last else first == last end
    to_return << result
  end
  to_return
end
