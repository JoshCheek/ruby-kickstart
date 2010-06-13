# previously, I copied the code from the example into this file.
# but now that you know about require, I'll just tell it to go require the file
require 'pathname'                                              # gets us Pathname class from the stdlib that makes it much easier to deal with paths :)
current_dir = Pathname.new __FILE__                             # create a pathname relative to our current file
require current_dir.parent.parent + 'examples' + '1_stack.rb'   # if our default dir was the same as current, this would be like saying $ cd ../examples/1_stack.rb


# ============================================================================================

# Remember, inspect returns a String that represents our object
# What does that look like right now, for the Stack?
nums = Stack.new
nums.push 1
nums.push 2
nums.push 3
nums # => #<Stack:0x10016b448 @first_node=#<Stack::Node:0x100168658 @data=3, @next=#<Stack::Node:0x1001686d0 @data=2, @next=#<Stack::Node:0x100168748 @data=1, @next=nil>>>>

# Well that's pretty ugly. Try looking at that to get whatever information you are interested in
# If we brek it down, it is easier to see the internal structure: # !> `*' interpreted as argument prefix
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

# Still pretty rough. What we would really like is something that shows the internal structure of our stack. 
# Something like this: (3)2)1)
# That looks to me like three discs each with one of our data (3) (2) (1)
# When we place the 3 over the 2, and the 2 over the 1, as a stack conceptually does, we get (3)2)1)

# Your task then, is to override our inspect method to get this kind of behaviour


# EXAMPLES:
# Stack.new(1,2,3,4,5).inspect              # => "(5)4)3)2)1)"
# s = Stack.new << 1 << 2 << 3              
# s.inspect                                 # => "(3)2)1)"
# s << /abc/                                
# s.inspect                                 # => "(/abc/)3)2)1)"
# Stack.new.inspect                         # => "()"
# Stack.new(nil,false,true,"abc",[1,2,3])   # => "(nil)false)true)\"abc\")[1,2,3])"

# REMEMBER: The Stack class alredy exists, the same as if we had written its source code in this file.
# you dont need to rewrite it, you just need to give it an inspect method that is useful to us.