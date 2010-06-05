def shared( a , b )

  # a hash table whose keys will be [nil,nil] the first time they are accessed
  track_seen = Hash.new do |hash,missing_key| 
    hash[missing_key] = Array.new 2
  end

  # set each element from a to be true for the first index
  a.each do |element|
    track_seen[element][0] = true
  end
  
  # set each element from b to be true for the second index
  b.each do |element|
    track_seen[element][1] = true
  end
  
  # each element that was seen by both is added to the union Array
  union = Array.new
  track_seen.each do |element,seen|
    union << element if seen[0] && seen[1]
  end
  
  # an alternative syntax here would be [track_seen,union.sort] on the last line
  return track_seen , union.sort
end
