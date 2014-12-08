def passthrough(enumerable, to_pass, &block)
  enumerable.each do |element|
    to_pass = block.call(to_pass, element)
  end
  to_pass
end
