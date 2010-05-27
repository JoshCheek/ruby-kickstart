def have_three( ary )
  indexes = Array.new
  ary.each_with_index do |num,index|
    if num == 3
      return false if indexes.last && indexes.last == index - 1
      indexes << index
    end
  end
  indexes.length == 3
end
