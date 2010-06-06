describe 'square_up' do
  
  it 'should return [0, 0, 1, 0, 2, 1, 3, 2, 1] when given 3' do
    square_up(3).should == [0, 0, 1, 0, 2, 1, 3, 2, 1]
  end
  
  it 'should return [ 0,1, 2,1] when given 2' do
    square_up(2).should == [0, 1, 2, 1]
  end
  
  it 'should return [0,0,0,1 , 0,0,2,1 , 0,3,2,1 , 4,3,2,1] when given 4' do
    square_up(4).should == [0,0,0,1 , 0,0,2,1 , 0,3,2,1 , 4,3,2,1]
  end
  
  it 'should return 1 when given [1]' do
    square_up(1).should == [1]
  end
  
  it 'should return 0 when given []' do
    square_up(0).should == [0]
  end
    
    
  it 'should return 6 when given [0,0,0,0,0,1 , 0,0,0,0,2,1 , 0,0,0,3,2,1 , 0,0,4,3,2,1 , 0,5,4,3,2,1 , 6,5,4,3,2,1]' do
    square_up(6).should == [0,0,0,0,0,1 , 0,0,0,0,2,1 , 0,0,0,3,2,1 , 0,0,4,3,2,1 , 0,5,4,3,2,1 , 6,5,4,3,2,1]
  end

end
