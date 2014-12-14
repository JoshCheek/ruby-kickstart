# I'm going to show you 4 different ways you might do this.
# (in reality, you wouldn't use any, you'd just use an Array ;P)


# Because each way below uses the same inspect method, I've
# pulled it out into its own module, they'll all use this one.
module ListInspect
  def inspect
    result = '#<List: '
    each { |element| result << "#{element.inspect}, " }
    result.sub!(/, $/, '')
    result + '>'
  end
end


# =====  Store in an Array, mix in Enumerable  =====
# In this one, you keep track of an Array, then delegate the `<<` and
# `each` methods to it. Since Enumerable only needs an each method,
# everything works just fine. This is my favourite.
class List
  include ListInspect
  include Enumerable

  def initialize
    @array = []
  end

  def <<(element)
    @array << element
    self
  end

  def each(&block)
    @array.each(&block)
  end
end


# =====  Subclass Array  =====
# # This is the simplest thing you could have possibly done, because
# # the Array class implements all of the same methods your List
# # needs to, you could just subclass Array (List _is_ an Array)
# # and then override inspect.
# class List < Array
#   include ListInspect
# end


# =====  Write our own linked list, mix in Enumerable  =====
# # Yikes, this one is pretty scary! It's a linked list, where we put
# # each piece of data into a node, and have it keep track of the next
# # piece of data. Since we want to traverse it in insertion order, we
# # have to keep track of both the first and last items in the list.
# #
# # Isn't it fascinating how we can have such vastly different
# # implementations that all support the same interface?
# class List
#   include ListInspect
#   include Enumerable
#
#   class Node
#     attr_accessor :data, :link
#     def initialize(data, link)
#       @data = data
#       @link = link
#     end
#   end
#
#   def initialize
#     @first = nil
#     @last  = nil
#   end
#
#   def <<(element)
#     node = Node.new(element, nil)
#     @last.link = node if @last
#     @last = node
#     @first ||= @last
#     self
#   end
#
#   def each(&block)
#     crnt = @first
#     while crnt
#       block.call crnt.data
#       crnt = crnt.link
#     end
#   end
# end
