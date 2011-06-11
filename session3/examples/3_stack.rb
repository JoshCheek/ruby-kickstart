class Stack
  
  def initialize(*values)
    self.first_node = nil
    push *values
  end

  def each(&block)
    each_node { |node| block.call node[:data] }
    self
  end
  
  def push(*datas)
    datas.each do |data|
      new_node = { :next => first_node , :data => data }
      self.first_node = new_node
    end
    self
  end
  
  def pop
    return nil unless node = first_node
    self.first_node = first_node[:next]
    node[:data]
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
      node = node[:next]    # once it gets to the end, returns nil
    end
  end
  
end


stack = Stack.new 77,90,"jkl",[67,90],{0=>8,:acv=>98}
stack.push(5).push(6).push(9).push(10).push('abc')
stack.push 1 , 2 , 3 , 4 , 5
stack.each { |data| p data }


puts "\n" * 5 + "using pop"
stack = Stack.new *(1..10) # the splat will invoke the to_a method before lining up params and args
puts stack.pop until stack.empty?