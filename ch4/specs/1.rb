describe 'Stack#inspect' do
  
  it 'should be ()' do
    Stack.new.inspect.should == "()"
  end

  it 'should be (1)' do
    Stack.new(1).inspect.should == '(1)'
  end

  it 'should be ({1=>2})' do
    Stack.new({1=>2}).inspect.should == '({1=>2})'
  end
  
  it 'should be (3)2)1)' do
    nums = Stack.new
    nums.push 1
    nums.push 2
    nums.push 3
    nums.inspect.should == '(3)2)1)'
  end
  
  it 'should be (5)4)3)2)1)' do
    Stack.new(1,2,3,4,5).inspect.should == "(5)4)3)2)1)"
  end
  
  it 'should be (3)2)1)' do
    s = Stack.new.push(1).push(2).push(3)
    s.inspect.should == "(3)2)1)"
  end

  it 'should be (/abc/)3)2)1)' do
    s = Stack.new.push(1).push(2).push(3)
    s.push(/abc/)
    s.inspect.should == "(/abc/)3)2)1)"
  end
  
  it 'should be ([1, 2, 3])"abc")true)false)nil)' do
    Stack.new(nil,false,true,"abc",[1,2,3]).inspect.should == '([1, 2, 3])"abc")true)false)nil)'
  end
  
end