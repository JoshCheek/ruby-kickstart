describe 'not_replace' do

  it 'should return "is not test" when given not_replace("is test")' do
    not_replace("is test").should == "is not test"
  end

  it 'should return "is not-is not" when given not_replace("is-is")' do
    not_replace("is-is").should == "is not-is not"
  end

  it 'should return "This is not right" when given not_replace("This is right")' do
    not_replace("This is right").should == "This is not right"
  end

  it 'should return "This is not isabell" when given not_replace("This is isabell")' do
    not_replace("This is isabell").should == "This is not isabell"
  end

  it 'should return "" when given not_replace("")' do
    not_replace("").should == ''
  end

  it 'should return "is not" when given not_replace("is")' do
    not_replace("is").should == 'is not'
  end

  it 'should return "isis" when given not_replace("isis")' do
    not_replace("isis").should == "isis"
  end

  it 'should return "Dis is not bliss is not" when given not_replace("Dis is bliss is")' do
    not_replace("Dis is bliss is").should == "Dis is not bliss is not"
  end

  it 'should return "is not his" when given not_replace("is his")' do
    not_replace("is his").should == "is not his"
  end

  it 'should return "xis yis" when given not_replace("xis yis")' do
    not_replace("xis yis").should == "xis yis"
  end

  it 'should return "AAAis is not" when given not_replace("AAAis is")' do
    not_replace("AAAis is").should == "AAAis is not"
  end

end