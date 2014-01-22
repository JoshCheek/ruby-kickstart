# Modules have the feel of a class in that you define methods in them.
# But since they cannot be instantiated, you must declare that the
# methods in the module should be included in a class, and the module
# will be added to the inheritance chain, making its methods available.
module OurModule
  def meth
    'method from OurModule'
  end
end

# When we include OurModule in a class, it becomes an ancestor
class OurClass
  include OurModule
end
OurClass.ancestors # => [OurClass, OurModule, Object, Kernel, BasicObject]

# This means its instances can invoke OurModule's methods
OurClass.new.meth # => "meth from M"

