# Give the person a birthday method that will increment their age by 1
# The birthday method should return their new age
#
# josh = Person.new 'Josh' , 27
#
# josh.birthday # => 28
# josh.age      # => 28
#
# josh.birthday # => 29
# josh.age      # => 29

class Person
  
  attr_accessor 'name' , 'age'
  
  def initialize(name,age)
    @name = name
    @age  = age
  end
  
  def birthday
    @age += 1
  end
  
end