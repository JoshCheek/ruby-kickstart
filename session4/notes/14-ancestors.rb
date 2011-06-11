# The chain of superclasses are called ancestors.
class Superclass
end

class Subclass < Superclass
end

Subclass.ancestors      # => [Subclass, Superclass, Object, Kernel, BasicObject]
Subclass                # => Subclass
Subclass.superclass     # => Superclass
Superclass.superclass   # => Object
Object.superclass       # => BasicObject
BasicObject.superclass  # => nil

# Kernel doesn't fit in, that's because it's not a class,
# it's a module. We'll talk about modules next time.
