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
   
  [  -7 ,  -6 , -3.5 ,
     1  ,  -1 , -0.5 ,  
    -1  ,   1 , -0.5 ,   
    -1  ,  -1 , -0.5 ,  
     0  ,   0 ,    0 ,      
     0  , 100 ,    0 ].each_slice 3 do |a,b,result|
    it "should return #{result} when given #{a} , #{b}" do
      arithmetic2(a,b).should == result
    end
  end

end

