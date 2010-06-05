describe 'shared' do
  
  it "should return [ { 1=>[true,true] , 2=>[true,true] , 3=>[true,nil] , 4=>[nil,true] } , [1,2] ] when given [1,2,3] , [1,2,4]" do
    shared( [1,2,3] , [1,2,4] ).should == [ { 1=>[true,true] , 2=>[true,true] , 3=>[true,nil] , 4=>[nil,true] } , [1,2] ]
  end  
  
  it "should return [ { 'a'=>[true,nil] , 'b'=>[true,true] , 'c'=>[true,nil] , 'd'=>[true,true] , 'aa'=>[nil,true] , 'cc'=>[nil,true] } , ['b','d'] ] when given %w(a b c d) , %w(aa b cc d)" do
    shared( %w(a b c d) , %w(aa b cc d) ).should ==[ { 'a'=>[true,nil] , 'b'=>[true,true] , 'c'=>[true,nil] , 'd'=>[true,true] , 'aa'=>[nil,true] , 'cc'=>[nil,true] } , ['b','d'] ]
  end
  
  it "should return [ { 1=>[nil,true] , 2=>[nil,true] } , [] ] when given [] , [1,2]" do
    shared( [] , [1,2] ).should == [ { 1=>[nil,true] , 2=>[nil,true] } , [] ]
  end
  
  it "should return [ { 1=>[true,nil] , 2=>[true,nil] } , [] ] when given [1,2] , []" do
    shared( [1,2] , [] ).should == [ { 1=>[true,nil] , 2=>[true,nil] } , [] ]
  end
  
  it "should return [ { } , [] ] when given [] , []" do
    shared( [] , [] ).should == [ { } , [] ]
  end
  
  it "should return [ { 1=>[true,nil] , 2=>[true,nil] , 'a'=>[nil,true] , 'b'=>[nil,true] , :c=>[true,true] } , [:c] ] when given [1,2,:c] , ['a','b',:c]" do
    shared( [1,2,:c] , ['a','b',:c] ).should == [ { 1=>[true,nil] , 2=>[true,nil] , 'a'=>[nil,true] , 'b'=>[nil,true] , :c=>[true,true] } , [:c] ]    
  end
  
  it "should return [ { 1=>[true,true] , 2=>[true,true] , 3=>[true,true] } , [1,2,3] ] when given [1,2,3] , [3,2,1]" do
   shared( [1,2,3] , [3,2,1] ).should == [ { 1=>[true,true] , 2=>[true,true] , 3=>[true,true] } , [1,2,3] ] 
  end
  
end
