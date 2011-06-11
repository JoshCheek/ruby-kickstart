describe 'context' do
  specify '1_stack_classes_inspect should have been required' do
    path = File.dirname(__FILE__) + "/../challenge/1_stack_classes_inspect.rb"
    path = File.expand_path(path)
    $LOADED_FEATURES.map { |filename| File.expand_path filename }.should include path
  end
end

describe 'StackInDisguise' do
  
  specify 'it should be a subclass of Stack' do
    StackInDisguise.superclass.should == Stack
  end
  
  describe '#inspect' do
  
    before :each do
      @stack = StackInDisguise.new
    end
    
    it 'should be overridden' do
      @stack.method(:inspect).owner.should == StackInDisguise
    end
  
    it 'should be []' do
      @stack.inspect.should == "[]"
    end

    it 'should be [1]' do
      @stack.push 1
      @stack.inspect.should == '[1]'
    end

    it 'should be [{1=>2}]' do
      @stack.push({1=>2})
      @stack.inspect.should == '[{1=>2}]'
    end
  
    it 'should be [1, 2, 3]' do
      (1..3).each { |i| @stack.push i }
      @stack.inspect.should == '[1, 2, 3]'
    end
  
    it 'should be [1, 2, 3, 4, 5]' do
      (1..5).each { |i| @stack.push i }
      @stack.inspect.should == '[1, 2, 3, 4, 5]'
    end
  
    it 'should be [1, 2, 3, /abc/]' do
      (1..3).each { |i| @stack.push i }
      @stack.push(/abc/)
      @stack.inspect.should == '[1, 2, 3, /abc/]'
    end
  
    it 'should be [nil, false, true, "abc", [1, 2, 3]]' do
      [nil,false,true,"abc",[1,2,3]].each { |e| @stack.push e }
      @stack.inspect.should == '[nil, false, true, "abc", [1, 2, 3]]'
    end
  end
end