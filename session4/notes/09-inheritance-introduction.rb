# Sometimes you have a generic idea of your class, but it can be
# realized in several specific ways. Sometimes, in Object Oriented
# Programming, we will subclass the generic class, called the
# superclass, and write more specific implementations. (Note that
# this has largely fallen out of favour in the Ruby community).

class Superclass
end

# Use the < to indicate inheritance
class Subclass < Superclass
end

Subclass.superclass # => Superclass

