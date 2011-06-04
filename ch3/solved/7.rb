def your_sort( array , &orderer )

  # if it is nil, then it hasn't been set, default to spaceship operator for comparison result
  orderer = Proc.new { |a,b| a <=> b } unless orderer
  
  array.each_index do |index1|
    array.each_index do |index2|
      array[index1] , array[index2] = array[index2] , array[index1] if orderer.call(array[index1],array[index2]) < 0
    end
  end

end
