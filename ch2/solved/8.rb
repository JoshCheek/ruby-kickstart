def zero_max( ary )
  ary.each_with_index do |element, index|
    if element == 0
      right_max = (ary[index..-1].reject { |i| i % 2 == 0 }).max
      ary[index] = right_max if right_max
    end
  end
end