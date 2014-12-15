# This will be our superclass. There are many kinds of employees but
# they all have wages, and each type makes a certain dollars per hour.
class Employee
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


# Bill is a clerk, he makes 160 hours * $20 per hour = $3200
class Clerk < Employee
  self.dollars_per_hour = 20
end
bill = Clerk.new 160
bill.wages  # => 3200


# Ayaan is an engineer, she makes
# 160 hours * $30 per hour + $500 per month = $5300
class Engineer < Employee
  self.dollars_per_hour = 30
  def wages
    super + 500
  end
end
ayaan = Engineer.new 160
ayaan.wages # => 5300
