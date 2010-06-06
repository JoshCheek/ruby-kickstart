class LinkedList
  
  def initialize(*values)
    self.first_node = nil
    add *values
  end

  def each(&block)
    each_node { |node| block.call node[:data] }
    self
  end
  
  def add(*datas)
    datas.each do |data|
      new_node = { :next => first_node , :data => data }
      self.first_node = new_node
    end
    self
  end
  
  def delete( data_to_delete = nil , &block )
    raise ArgumentError.new("must pass either data or a select block") unless data_to_delete || block
    return Array.new unless first_node
    block ||= lambda { |data| data == data_to_delete }
    each_node do |node|
      next_node = node[:next]
      node[:next] = next_node[:next] if next_node && block[next_node.data]
    end
    self.first_node = first_node[:next] if block[first_node]
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
      node = node[:next]
    end
  end
  
end


ll = LinkedList.new 77,90,"jkl",[67,90],{0=>8,:acv=>98}
ll.add(5).add(6).add(9).add(10).add('abc')
ll.add 1 , 2 , 3 , 4 , 5

ll.each { |data| p data }
