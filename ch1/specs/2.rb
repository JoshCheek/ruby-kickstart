describe 'arithmetic2' do

  it 'should return 0.5 when give 1 , 2' do
    arithmetic2(1,2).should == 0.5
  end

  it 'should return 5.0 when given 19 , 10' do
    arithmetic2(19,10).should == 5.0
  end
  
  it 'should return -3.5 when given -6 , -7' do
    arithmetic2(-6,-7).should == -3.5
  end
  
  it 'should pass other tests' do
    arithmetic2(-7,-6).should == -3.5
    arithmetic2(1,-1).should == -0.5
    arithmetic2(-1,1).should == -0.5
    arithmetic2(-1,-1).should == -0.5
    arithmetic2(0,0).should == 0
    arithmetic2(0,100).should == 0
  end
  
end

