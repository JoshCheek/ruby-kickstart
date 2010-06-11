# show more interesting booleans
# show public protected private
# introspection
# ranges
# file io
# inject
# irb


# =====  inheritence  =====
# Sometimes you have a generic idea of your class, but it can be realized in several specific ways
# Commonly, in Object Oriented Programming, we will subclass the generic class, and write more specific implementations.
class Employee
  
  # Class variables are shared by inherited classes
  # So we are using instance variables, that way Engineer
  # and Clerk can each have their own value for this variable
  class << self
    attr_accessor :dollars_per_hour
  end  
  
  attr_accessor :hours_worked
  
  def initialize( hours_worked )
    self.hours_worked = hours_worked
  end
  
  def wages
    self.class.dollars_per_hour * hours_worked
  end
  
end


class Clerk < Employee
  self.dollars_per_hour = 20
end



class Engineer < Employee
  self.dollars_per_hour = 30

  # in addition to getting paid by the hour, the Engineer gets
  # an additional base $500 per month
  def wages
    super + 500     # we can use super to invoke the wages method we inherited from employee
  end
end


# Bill is a clerk, he makes 160 hours * $20 per hour = $3200
bill = Clerk.new 160
bill.wages  # => 3200

# Ayaan is an engineer, she makes 160 hours * $30 per hour + $500 per month = $5300
ayaan = Engineer.new 160
ayaan.wages # => 5300


# =====  Modules  =====
# Comparable

# rubygems
