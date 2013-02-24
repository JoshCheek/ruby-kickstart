# Another common thing is to forward blocks to other methods
def meth1(&block)
  "(meth1: #{block.call})"
end


# Use the & notation when calling a method to put a block into
# the method's block slot.
def meth2(&block)
  "#{meth1(&block)} (meth2: #{block.call})"
end

counter = 0
meth2 { counter += 10 } # => "(meth1: 10) (meth2: 20)"
