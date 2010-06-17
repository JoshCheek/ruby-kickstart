class Stack

  # a nested class, from the outside we can access it with Stack::Node
  # from inside, of LinkedList, we can just say Node
  class Node
    attr_accessor :next , :data
    def initialize( next_node , data )
      self.next , self.data = next_node , data
    end
  end



  def initialize(*values)
    self.first_node = nil
    push *values
  end

  def each(&block)
    each_node { |node| block.call node.data }
    self
  end
  
  def push(*datas)
    datas.each do |data|
      new_node = Node.new first_node , data
      self.first_node = new_node
    end
    self
  end
  
  def pop
    return nil unless node = first_node
    self.first_node = first_node.next
    node.data
  end
  
  def empty?
    !first_node
  end
  
private

  # we are making these methods private, because they are for internal implementation
  # we don't want outside users to have to worry about our implementation (encapsulation)
  # really, the Node class should go in here as well, but then I couldn't have told you about Stack::Node :)
  attr_accessor :first_node
  
  def each_node
    node = first_node
    while node
      yield node
      node = node.next    # once it gets to the end, returns nil
    end
  end
  
end
