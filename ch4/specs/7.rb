describe 'more14' do
  it 'should return true when given more14(1, 4, 1)' do
    more14(1, 4, 1).should == true
  end

  it 'should return false when given more14(1, 4, 1, 4)' do
    more14(1, 4, 1, 4).should == false
  end
  
  it 'should return true when given more14(1, 1)' do
    more14(1, 1).should == true
  end
  
  it 'should return true when given more14(1, 6, 6)' do
    more14(1, 6, 6).should == true
  end
  
  it 'should return true when given more14(1)' do
    more14(1).should == true
  end
  
  it 'should return false when given more14(1, 4)' do
    more14(1, 4).should == false
  end
  
  it 'should return true when given more14(6, 1, 1)' do
    more14(6, 1, 1).should == true
  end
  
  it 'should return false when given more14(1, 6, 4)' do
    more14(1, 6, 4).should == false
  end
  
  it 'should return true when given more14(1, 1, 4, 4, 1)' do
    more14(1, 1, 4, 4, 1).should == true
  end
  
  it 'should return true when given more14(1, 1, 6, 4, 4, 1)' do
    more14(1, 1, 6, 4, 4, 1).should == true
  end
  
  it 'should return false when given more14()' do
    more14().should == false
  end
  
  it 'should return false when given more14(4, 1, 4, 6)' do
    more14(4, 1, 4, 6).should == false
  end
  
  it 'should return false when given more14(4, 1, 4, 6, 1)' do
    more14(4, 1, 4, 6, 1).should == false
  end
  
  it 'should return true when given more14(1, 4, 1, 4, 1, 6)' do
    more14(1, 4, 1, 4, 1, 6).should == true
  end
  
end