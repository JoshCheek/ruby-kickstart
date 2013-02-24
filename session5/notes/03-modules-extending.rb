# Sometimes we want to give the module's functionality to just one
# object. In this case, we include it in the object's singleton class.
module OurModule
  def meth
    'method from M'
  end
end

obj = Object.new
class << obj
  include OurModule
end
obj.singleton_class.ancestors   # => [OurModule, Object, Kernel, BasicObject]
obj.meth                        # => "method from M"


# Unfortunately, that's a little bit annoying to write, so there
# is a shortcut syntax. Extending an object with a module is the
# same as including the module in its singleton class.
obj = Object.new
obj.extend OurModule
obj.singleton_class.ancestors   # => [OurModule, Object, Kernel, BasicObject]
obj.meth                        # => "method from M"

