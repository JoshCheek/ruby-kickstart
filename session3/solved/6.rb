def match_maker(opposites_attract, *elements)
  to_return = []
  elements.each_slice 2 do |first, last|
    first  = !!first
    last   = !!last
    result = if opposites_attract
               first != last
             else
               first == last
             end
    to_return << result
  end
  to_return
end
