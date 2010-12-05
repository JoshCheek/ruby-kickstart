describe 'arithmetic1' do

  it 'should return 30 when passed 10' do
    arithmetic1(10).should == 30
  end
  
  it 'should return 32.5 when passed 10.5' do
    arithmetic1(10.5).should == 32.5
  end
  
  it 'should return -50 when passed -6' do
    arithmetic1(-6).should == -50
  end
  
  it 'should return 480 when passed 100' do
    arithmetic1(100).should == 480
  end
  
end