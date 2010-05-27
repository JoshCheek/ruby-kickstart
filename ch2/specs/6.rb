
describe '6 array' do
  [
    [1, 0, 0, 1]       , [0, 0, 1, 1]       ,
    [0, 1, 1, 0, 1]    , [0, 0, 1, 1, 1]    ,
    [1, 0]             , [0, 1]             ,
    [0, 1]             , [0, 1]             ,
    [1, 1, 1, 0]       , [0, 1, 1, 1]       ,
    [2, 2, 2, 2]       , [2, 2, 2, 2]       ,
    [0, 0, 1, 0]       , [0, 0, 0, 1]       ,
    [-1, 0, 0, -1, 0]  , [0, 0, 0, -1, -1]  ,
    [0, -3, 0, -3]     , [0, 0, -3, -3]     ,
    []                 , []                 ,
    [9, 9, 0, 9, 0, 9] , [0, 0, 9, 9, 9, 9] ,
  ].each_slice 2 do |input,output|
    it "should return #{output.inspect} when given #{input.inspect}" do
      zero_front(input).should == output
    end
  end
end