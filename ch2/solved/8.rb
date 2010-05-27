def zero_max(ary)
  largest = 0
  ary.reverse.map do |i|
    if i == 0
      largest
    else
      largest = i  if  i%2==1  &&  largest<i
      i
    end
  end.reverse
end