# load the stack code in
require File.dirname(__FILE__) + "/../challenge/1_stack_classes_inspect"


class Stack
  def inspect
    current = @head
    to_return = "("
    while current
      to_return << current.data.inspect
      to_return << ")"
      current = current.next_node
    end
    to_return << ")" if to_return == "("
    to_return
  end
end
