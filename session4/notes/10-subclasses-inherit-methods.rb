class Superclass
  def self.class_method
    'class_method from Superclass'
  end

  def instance_method
    'instance_method from Superclass'
  end
end

class Subclass < Superclass
end

# Subclasses inherit methods from their superclass
Subclass.class_method         # => "class_method from Superclass"
Subclass.new.instance_method  # => "instance_method from Superclass"

