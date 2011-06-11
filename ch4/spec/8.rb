describe 'exception_raiser' do
  
  it 'should raise #<RuntimeError: No 1s allowed!> when given 1' do
    Proc.new { exception_raiser 1 }.should raise_error(RuntimeError, "No 1s allowed!")
  end
  
  it 'should raise #<ArgumentError: No 2s allowed!> when given 2' do
    Proc.new { exception_raiser 2 }.should raise_error(ArgumentError, "No 2s allowed!")
  end
  
  it 'should raise #<Exception: No 3s allowed!> when given 3' do
    Proc.new { exception_raiser 3 }.should raise_error(Exception, "No 3s allowed!")
  end
  
  it 'should raise #<SyntaxError: No 4s allowed!> when given 4' do
    Proc.new { exception_raiser 4 }.should raise_error(SyntaxError, "No 4s allowed!")
  end
  
  it 'should raise #<RubyKickstartException: No 5s allowed!> when given 5' do
    Proc.new { exception_raiser 5 }.should raise_error(RubyKickstartException, "No 5s allowed!")
  end
  
  [-1, 0, "abc", /abc/].each do |object|
    it "shouldn't raise an error when it receives #{object.inspect}" do
      Proc.new { exception_raiser object }.should_not raise_error
    end
  end
  
end

