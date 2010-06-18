# Remember, inspect returns a String that represents our object
# What does that look like right now, for the Stack?
#
# nums = Stack.new
# nums.push 1
# nums.push 2
# nums.push 3
# nums # => #<Stack:0x10016b448 @first_node=#<Stack::Node:0x100168658 @data=3, @next=#<Stack::Node:0x1001686d0 @data=2, @next=#<Stack::Node:0x100168748 @data=1, @next=nil>>>>
#
# Well that's pretty ugly. Try looking at that to get whatever information you are interested in
# If we break it down, it is easier to see the internal structure:
# <Stack:0x1001989c0 
#   @first_node = <Stack::Node:0x1001988d0 
#     @next = <Stack::Node:0x1001988f8 
#       @next = <Stack::Node:0x1001988a8 
#         @next=nil , 
#         @data=1 
#       >, 
#       @data = 2
#     >, 
#     @data=3
#   >
# >
#
# Still pretty rough. What we would really like is something that shows the internal structure of our stack. 
# Something like this: (3)2)1)
# That looks to me like three discs each with one of our data (3) (2) (1)
# When we place the 3 over the 2, and the 2 over the 1, as a stack conceptually does, we get (3)2)1)
#
# Your task then, is to override our inspect method to get this kind of behaviour
#
#
# EXAMPLES:
# Stack.new(1,2,3,4,5).inspect              # => "(5)4)3)2)1)"
# s = Stack.new.push(1).push(2).push(3)              
# s.inspect                                 # => "(3)2)1)"
# s.push /abc/                                
# s.inspect                                 # => "(/abc/)3)2)1)"
# Stack.new.inspect                         # => "()"
# Stack.new(nil,false,true,"abc",[1,2,3])   # => "([1, 2, 3])"abc")true)false)nil)"

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
