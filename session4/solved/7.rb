def longest_method(object)
  object.methods.max_by { |meth| meth.length }
end
