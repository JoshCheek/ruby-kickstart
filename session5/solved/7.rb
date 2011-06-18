def tree_parser(trees)
  results = []
  trees.each_line do |line|
    /^(.*)[,;] which ships (at|@) (.*), cost:? (.*)$/i =~ line
    results << [$1, $3, $4]
  end
  results
end
