class LinkedList
  
  # a nested class, from the outside we can access it with LinkedList::Node
  # from inside, of LinkedList, we can just say Node
  class Node
    attr_accessor :next , :data
    def initialize( options = Hash.new )
      self.next , self.data = options[:next] , options[:data]
    end
  end

  include Enumerable
  
  def initialize(*params)
    self.first_node = nil
    params.each { |param| self << param }
  end

  def each(&block)
    each_node { |node| block.call node.data }
    self
  end
  
  def <<(data)
    new_node = Node.new :next => first_node , :data => data
    self.first_node = new_node
    self
  end
  
  def delete( data_to_delete = nil , &block )
    raise ArgumentError.new("must pass either data or a select block") unless data_to_delete || block
    return Array.new unless first_node
    block ||= lambda { |data| data == data_to_delete }
    each_node do |node|
      next_node = node.next
      node.next = next_node.next if next_node && block[next_node.data]
    end
    self.first_node = first_node.next if block[first_node]
  end

private

  # we are making these methods private, because they are for internal implementation
  # we don't want outside users to have to worry about our implementation (encapsulation)
  # really, the Node class should go in here as well, but then I couldn't have told you about LinkedList::Node :)
  attr_accessor :first_node
  
  def each_node
    node = first_node
    while node
      yield node
      node = node.next
    end
  end
  
end


ll = LinkedList.new 77,90,"jkl",[67,90],{0=>8,:acv=>98}
ll << 5 << 6 << 9 << 10 << 'abc'

ll.each { |data| p data }
p ll.select { |data| data.is_a?(Numeric) && data % 2 == 0 }
puts
ll.delete { |data| data == 5 || data == 10 }
ll.each { |data| p data }