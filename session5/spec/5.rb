THELIST = Module.constants.grep(/error|exception/i)

def should_find(error_to_find)
  Object.const_set error_to_find , Class.new(StandardError)
  THELIST << Module.constants.grep(/^#{error_to_find}$/).first
  it "should find #{error_to_find}" do
    list_of_errors_and_exceptions.sort.should == THELIST.sort
  end
end


describe 'list_of_errors_and_exceptions' do
  
  it 'should return an Array' do
    list_of_errors_and_exceptions.is_a?(Array).should be_true
  end
  
  it 'should return a list of all errors and exceptions' do
    list_of_errors_and_exceptions.sort.should == THELIST.sort
  end
  
  %w(
    Lowercaseerror 
    Lowercaseexception 
    Errorerr 
    Exceptionatstart 
    ExceptionAtStart 
    ExcEPtion 
    Abcexceptiondef
  ).each do |error_to_find|
    should_find error_to_find
  end
  
end