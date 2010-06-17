# Well, we love being able to overload operators
# But it gets to be a tad tedious after a while.
# 
# Wouldn't it be great if we could write those methods one time, 
# and have them work for any class we wanted to drop them into?
# 
# Your mission then, is to write a module that uses the spaceship operator <=>
# to write the methods < , <= , == , > , and >=
#
#
#
# EXAMPLE:
# 
# 
# class Student
#   
#   include OperatorGeneratorFromSpace
#   
#   GRADES = [ :freshman , :sophmore , :junior , :senior ]
#   
#   attr_accessor :age , :grade
#   
#   def initialize( age , grade )
#     @age , @grade = age , grade
#   end
#   
#   def <=>(student)
#     if age == student.age
#       GRADES.index(grade) <=> GRADES.index(student.grade)
#     else
#       age <=> student.age
#     end
#   end
#   
# end
# 
# Student.new(20,:freshman) == Student.new(20,:freshman)  # => true
# Student.new(20,:freshman) >  Student.new(20,:sophmore)  # => false
# Student.new(20,:sophmore) <  Student.new(20,:freshman)  # => false
# Student.new(20,:sophmore) <= Student.new(30,:freshman)  # => true
# Student.new(30,:sophmore) >= Student.new(20,:freshman)  # => true

module OperatorGeneratorFromSpace
  def >(other)
    (self <=> other) == 1
  end
  
  def >=(other)
    (self <=> other) == 1 || (self <=> other) == 0
  end
  
  def ==(other)
    (self <=> other) == 0
  end
  
  def <(other)
    (self <=> other) == -1
  end
  
  def <=(other)
    (self <=> other) == -1 || (self <=> other) == 0
  end
end