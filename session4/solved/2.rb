# 1's solution requires the actual file we are interested in
require File.dirname(__FILE__) + "/1"

class StackInDisguise < Stack
  def inspect
    ary = []
    current = @head
    while current
      ary << current.data
      current = current.next_node
    end
    ary.reverse.inspect
  end
end
