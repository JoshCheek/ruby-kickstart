describe 'caught_speeding' do 
  [ 60 , false , 0 ,
    65 , false , 1 ,
    65 , true  , 0 ,
    80 , false , 1 ,
    85 , false , 2 ,
    85 , true  , 1 ,
    70 , false , 1 ,
    75 , false , 1 ,
    75 , true  , 1 ,
    40 , false , 0 ,
    40 , true  , 0 ,
    90 , false , 2 ].each_slice 3 do |speed,birthday,result|
    it "should return #{result} when given #{speed} , #{birthday}" do
      caught_speeding(speed,birthday).should == result
    end
  end
end