describe 'Stack#inspect' do
  
  before :each do
    @stack = Stack.new
  end
  
  it 'should be ()' do
    @stack.inspect.should == "()"
  end

  it 'should be (1)' do
    @stack.push 1
    @stack.inspect.should == '(1)'
  end

  it 'should be ({1=>2})' do
    @stack.push({1=>2})
    @stack.inspect.should == '({1=>2})'
  end
  
  it 'should be (3)2)1)' do
    (1..3).each { |i| @stack.push i }
    @stack.inspect.should == '(3)2)1)'
  end
  
  it 'should be (5)4)3)2)1)' do
    (1..5).each { |i| @stack.push i }
    @stack.inspect.should == "(5)4)3)2)1)"
  end
  
  it 'should be (/abc/)3)2)1)' do
    (1..3).each { |i| @stack.push i }
    @stack.push(/abc/)
    @stack.inspect.should == "(/abc/)3)2)1)"
  end
  
  it 'should be ([1, 2, 3])"abc")true)false)nil)' do
    [nil,false,true,"abc",[1,2,3]].each { |e| @stack.push e }
    @stack.inspect.should == '([1, 2, 3])"abc")true)false)nil)'
  end
  
end