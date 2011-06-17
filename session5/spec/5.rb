errors = Module.constants.grep(/error|exception/i)

describe 'list_of_errors_and_exceptions' do
  
  # This sort of absurdness is to ensure we are explicitly looking
  # for the error, rather than replicating the same code in the
  # tests as the solution and having tests pass when they should fail.
  should_find = Proc.new do |error_to_find|
    Object.const_set error_to_find , Class.new(StandardError)
    errors << (errors.first.is_a?(Symbol) && error_to_find.to_sym || error_to_find.to_s) # this changes between 1.8 and 1.9, just make it work for both
    it "should find #{error_to_find}" do
      list_of_errors_and_exceptions.sort.should == errors.sort
    end
  end
  
  it 'should return an Array' do
    list_of_errors_and_exceptions.is_a?(Array).should be
  end
  
  it 'should return a list of all errors and exceptions' do
    list_of_errors_and_exceptions.sort.should == errors.sort
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
    should_find.call error_to_find
  end
  
end

