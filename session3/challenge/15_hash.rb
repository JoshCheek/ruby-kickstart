# For this problem, you will need to know how to use a linked list.
#
# A linked list is like a train, each car is connected to the car behind it. Then you just
# keep track of the engine, and you know where the whole train is. And you know when you reach
# the caboose because it's not got any more cars behind it.
#
# We'll implement our linked list with hash tables. So in a linked list, you keep track of the
# first hash in the list, usually called the head, and he points to the node after him.
# Similarly, the node after him, and every other node in the list point to the node after
# themselves, as well. Except the last node, which points to nil.
#
# head = {:data => 1, :next => nil}
# head = {:data => 2, :next => head}
# head                                # => {:data=>2, :next=>{:data=>1, :next=>nil}}
# head = {:data => 3, :next => head}
# head                                # => {:data=>3, :next=>{:data=>2, :next=>{:data=>1, :next=>nil}}}
#
# See? Each one just points to the next one after himself. Then you can say things like:
# head[:data]                 # => 3
# head[:next][:data]          # => 2
# head[:next][:next][:data]   # => 1
#
# ===========
#
# Now that we know what a linked list is, write a function named middle, which takes a linked list,
# and returns the data halfway down the list.
#
# EXAMPLES:
# head = {:data => 1, :next => nil}
# middle head                        # => 1
# head = {:data => 2, :next => head}
# middle head                        # => 1
# head = {:data => 3, :next => head}
# middle head                        # => 2
# head = {:data => 4, :next => head}
# middle head                        # => 2
# head = {:data => 5, :next => head}
# middle head                        # => 3
# head = {:data => 6, :next => head}
# middle head                        # => 3

def list_size(list)
  return 0 unless list
  1 + list_size(list[:next])
end

def middle(list, distance=list_size(list)/2)
  return list[:data] if distance == 0
  middle list[:next], (distance - 1)
end
