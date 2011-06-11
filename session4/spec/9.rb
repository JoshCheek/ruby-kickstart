FirstNameError  =  Class.new RuntimeError
LastNameError   =  Class.new RuntimeError

describe 'full_name' do
  
  it 'should be defined' do
    method(:full_name).should be
  end
  
  it 'should return "Nikola Tesla" when first_name="Nikola" and last_name="Tesla"' do
    person = mock "Person"
    person.should_receive(:first_name).and_return("Nikola")
    person.should_receive(:last_name).and_return("Tesla")
    full_name(person).should == "Nikola Tesla"
  end
  
  it 'should return "Sal Khan" when first_name="Sal" and last_name="Khan"' do
    person = mock "Person"
    person.should_receive(:first_name).and_return("Sal")
    person.should_receive(:last_name).and_return("Khan")
    full_name(person).should == "Sal Khan"
  end
  
  it 'Should return return "Tesla" when first_name raises error and last_name="Tesla"' do
    person = mock "Person"
    person.should_receive(:first_name).and_raise(FirstNameError)
    person.stub!(:last_name).and_return("Tesla")
    full_name(person).should == "Tesla"
  end
  
  it 'Should return return "Nikola" when first_name="Nikola" and last_name raises error' do
    person = mock "Person"
    person.stub!(:first_name).and_return("Nikola")
    person.should_receive(:last_name).and_raise(LastNameError)
    full_name(person).should == "Nikola"
  end
  
  it 'Should raise RuntimeError when first_name raises RuntimeError and last_name="Tesla"' do
    person = mock "Person"
    person.should_receive(:first_name).and_raise(RuntimeError)
    person.stub!(:last_name).and_return("Nikola")
    Proc.new { full_name person }.should raise_error(RuntimeError)
  end
  
  it 'Should raise RuntimeError when first_name="Nikola" and last_name raises RuntimeError' do
    person = mock "Person"
    person.stub!(:first_name).and_return("Nikola")
    person.should_receive(:last_name).and_raise(RuntimeError)
    Proc.new { full_name person }.should raise_error(RuntimeError)
  end
  
  it 'Should raise Exception when first_name raises Exception and last_name="Tesla"' do
    person = mock "Person"
    person.should_receive(:first_name).and_raise(Exception)
    person.stub!(:last_name).and_return("Nikola")
    Proc.new { full_name person }.should raise_error(Exception)
  end
  
  it 'Should raise Exception when first_name="Nikola" and last_name raises Exception' do
    person = mock "Person"
    person.stub!(:first_name).and_return("Nikola")
    person.should_receive(:last_name).and_raise(Exception)
    Proc.new { full_name person }.should raise_error(Exception)
  end
end

