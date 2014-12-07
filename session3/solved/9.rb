def shared(a, b)
  # union = Hash.new do |hash, key|
  #   hash[key] = [(a.include?(key)||nil), # include returns true or false, when false, it goes to the RHS of the ||, and becomes nil
  #                (b.include?(key)||nil)]
  # end

  union = {}
  a.each do |element|

    union[element] ||= [nil, nil]
    union[element][0] = true
  end

  b.each do |element|
    union[element] ||= [nil, nil]
    union[element][1] = true
  end

  result = union.select { |key, value| value == [true, true] }.map { |key, value| key }

  return union, result.sort
end
