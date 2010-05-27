describe 'make2' do
  
  it 'should return [4, 5] when given [4, 5] , [1, 2, 3]' do
    make2( [4,5] , [1,2,3] ).should == [4,5]
  end
  
  it 'should return [4, 1] when given [4] , [1, 2, 3]' do
    make2( [4] , [1,2,3] ).should == [4,1]
  end
  
  it 'should return [1, 2] when given [] , [1, 2]' do
    make2( [] , [1,2] ).should == [1,2]
  end
  
  it 'should return [1, 2] when given [1, 2] , []' do
    make2( [1,2] , [] ).should == [1,2]
  end
  
  it 'should return [3, 1] when given [3] , [1, 2, 3]' do
    make2( [3] , [1,2,3] ).should == [3,1]
  end
  it 'should return [3, 1] when given [3] , [1]' do
    make2( [3] , [1] ).should == [3,1]
  end
  it 'should return [3, 1] when given [3, 1, 4] , []' do
    make2( [3,1,4] , [] ).should == [3,1]
  end
  it 'should return [1, 1] when given [1] , [1]' do
    make2( [1] , [1] ).should == [1,1]
  end
  it 'should return [1, 2] when given [1, 2, 3] , [7, 8]' do
    make2( [1,2,3] , [7,8] ).should == [1,2]
  end
  it 'should return [7, 8] when given [7, 8] , [1, 2, 3]' do
    make2( [7,8] , [1,2,3] ).should == [7,8]
  end
  it 'should return [7, 1] when given [7] , [1, 2, 3]' do
    make2( [7] , [1,2,3] ).should == [7,1]
  end
  it 'should return [5, 4] when given [5, 4] , [2, 3, 7]' do
    make2( [5,4] , [2,3,7] ).should == [5,4]
  end
end