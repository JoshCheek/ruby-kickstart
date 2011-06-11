class Person
  
  attr_accessor :name
  
  def initialize( &initializer )
    @initializer = initializer
    initializer.call self
  end
  
  def reinit
    @initializer.call self
  end
  
end



artist = Person.new do |person|
  person.name = 'Prince'
end

artist.name           # => "Prince"
artist.name = 'The Artist Formerly Known As Prince'
artist.name          # => "The Artist Formarly Known As Prince"
artist.reinit
artist.name          # => "Prince"
