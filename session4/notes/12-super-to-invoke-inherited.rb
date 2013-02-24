# When you override a method, you can call the method
# you're overriding, with the keyword `super`.
class Superclass
  def self.class_method
    'class_method from Superclass'
  end
end

class Subclass < Superclass
  def self.class_method
    super + " | through Subclass"
  end
end

Subclass.class_method # => "class_method from Superclass | through Subclass"

