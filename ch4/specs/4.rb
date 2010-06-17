describe 'sum_digits' do

  it 'should return 6 when given sum_digits("aa1bc2d3")' do
    sum_digits("aa1bc2d3").should == 6
  end
  
  it 'should return 8 when given sum_digits("aa11b33")' do
    sum_digits("aa11b33").should == 8
  end
  
  it 'should return 0 when given sum_digits("Chocolate")' do
    sum_digits("Chocolate").should == 0
  end
  
  it 'should return 7 when given sum_digits("5hoco1a1e")' do
    sum_digits("5hoco1a1e").should == 7
  end
  
  it 'should return 12 when given sum_digits("123abc123")' do
    sum_digits("123abc123").should == 12
  end
  
  it 'should return 0 when given sum_digits("")' do
    sum_digits("").should == 0
  end
  
  it 'should return 0 when given sum_digits("Hello")' do
    sum_digits("Hello").should == 0
  end
  
  it 'should return 12 when given sum_digits("X1z9b2")' do
    sum_digits("X1z9b2").should == 12
  end
  
  it 'should return 14 when given sum_digits("5432a")' do
    sum_digits("5432a").should == 14
  end
  
end