# Lets say we wanted to know what planet people are from.
# Well, that information is the same across every person
# so we can keep it in an instance variable on the class.

class Person
  # When we define methods here, they get defined for
  # instances of Person, so we need to either store
  # them in Person's class or singleton class. It doesn't
  # make sense to give EVERY class a home_planet, so
  # lets put it on the singleton_class
  self # => Person
  class << self
    attr_accessor 'home_planet'
  end

  # remember, self is Person, so @home_planet
  # is defined on the Person class itself
  @home_planet = 'Erth'
  Person.home_planet  # => "Erth"
  Person.home_planet = 'Earth'
  @home_planet        # => "Earth"


  attr_accessor 'name'
  def initialize(name)
    # self is now an instance of person, so @name
    # is defined for this particular person
    @name = name
  end

  # This one is for instances
  def home_planet
    Person.home_planet
  end
end

Person.home_planet
kate = Person.new 'Kate Beckinsale'
josh = Person.new 'Josh Cheek'
kate.home_planet  # => "Earth"
josh.home_planet  # => "Earth"
kate.name         # => "Kate Beckinsale"
josh.name         # => "Josh Cheek"

Person.instance_variables # => [:@home_planet]
josh.instance_variables   # => [:@name]
