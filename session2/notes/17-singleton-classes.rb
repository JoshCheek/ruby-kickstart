# Turns out that every object actually has 2 classes!
# The one we've been using so far, and its singleton 
# class -- a class whose only instance is the object.

# So an object is defined by its class, but it also
# can have its own unique behaviour by defining
# methods on its singleton class.


# Singleton classes don't have names
obj = Object.new
obj.singleton_class # => #<Class:#<Object:0x00000100866ab8>>

# You can access the singleton class like this
class << obj
  def greet
    'Howdy, partner.'
  end
end
obj.singleton_class.instance_methods false # => [:greet]
obj.singleton_methods # => [:greet]
obj.greet # => "Howdy, partner."


# Shortcut syntax for the above
def obj.about
  "A plain old object with a few tricks."
end

obj.about # => "A plain old object with a few tricks."
obj.singleton_methods # => [:greet, :about]

# Question: if everything is an object, and every object
#   has a singleton class, then do singleton classes have
#   singleton classes?
# 
#   How can you test your answer out?
