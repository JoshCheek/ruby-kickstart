# When calling a setter method, always use an explicit
# receiver. Otherwise it looks like you're setting a
# local variable.

class Flight
  attr_accessor 'arrival_time'

  def reset
    arrival_time      # => 1100
    arrival_time = 0

    # Wait, wtf is this?
    arrival_time      # => 0
    self.arrival_time # => 1100

    # Oh, it thought we wanted to make a local variable
    # named arrival_time
    local_variables   # => [:arrival_time]

    # We should have made it explicit by specifying that
    # arrival_time= is a method on self
    self.arrival_time = 0
  end
end

f = Flight.new
f.arrival_time = 1100
f.reset
