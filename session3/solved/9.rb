def shared( a , b )
  union = Hash.new do |hash, key|
    hash[key] = Array.new
    if a.include? key then hash[key] << true else hash[key] << nil end
    if b.include? key then hash[key] << true else hash[key] << nil end
  end
  
  a.each { |element| union[element] }
  b.each { |element| union[element] }
  
  ary = Array.new
  
  union.each { |key, value| ary << key if union[key] == [true, true] }
  
  return union, ary.sort
end
