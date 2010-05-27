describe '5 array' do
  [
    [1, 2, 3]              , 3 ,     
    [1, 5, 3]              , 5 ,     
    [5, 2, 3]              , 5 ,     
    [1, 2, 3, 1, 1]        , 3 ,     
    [1, 7, 3, 1, 5]        , 5 ,     
    [5, 1, 3, 7, 1]        , 5 ,     
    [5, 1, 7, 3, 7, 8, 1]  , 5 ,     
    [5, 1, 7, 9, 7, 8, 1]  , 9 ,     
    [5, 1, 7, 3, 7, 8, 9]  , 9 ,     
    [2, 2, 5, 1, 1]        , 5 ,
  ].each_slice 2 do |input,output|
    it "should return #{output.inspect} when given #{input.inspect}" do
      max_triple(input).should == output
    end
  end
end

