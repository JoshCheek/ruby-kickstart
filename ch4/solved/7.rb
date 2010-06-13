def more14(*ary)
  seen = Hash.new 0
  ary.each { |i| seen[i] += 1 }
  seen[1] > seen[4]
end