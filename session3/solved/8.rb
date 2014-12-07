class Person
  attr_accessor :name, :age, :quote

  def initialize(options=Hash.new, &initializer)
    self.name    = options[:name]
    self.age     = options[:age]
    self.quote   = options[:quote]
    @initializer = (initializer || Proc.new { |person| }) # this way, it always has a proc, and code like reinit doesn't have to worry that it might not be there
    reinit
  end

  def reinit
    @initializer.call(self)
  end
end
