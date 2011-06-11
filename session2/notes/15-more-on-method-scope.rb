# So methods being their own little world is totally a lie
# They can actually see instance variables and methods
# on their object.

class Example
  
  def method1
    self # => #<Example:0x00000100868f98>
    @var = 123
    method2 
    @var # => 500
  end
  
  def method2
    self # => #<Example:0x00000100868f98 @var=123>
    @var # => 123
    @var = 500
  end
  
end

Example.new.method1
