# When you instantiate an object (make an instance
# of a class), you use the new method. After doing all
# the things necessary to make an object, the new method
# will invoke a method named initialize, and pass it
# any arguments you passed to new. This allows you to
# put your object into an initial state.

class Instrument
  def initialize(name, price)
    @name = name
    @price = price
  end

  attr_accessor 'name', 'price'
end

clarinet = Instrument.new 'Clarinet', 250
clarinet.name   # => "Clarinet"
clarinet.price  # => 250
