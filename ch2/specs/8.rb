describe 'zero_max' do
  [
    [0, 5, 0, 3]         ,  [5, 5, 3, 3]       ,
    [0, 4, 0, 3]         ,  [3, 4, 3, 3]       ,
    [0, 1, 0]            ,  [1, 1, 0]          ,
    [0, 1, 5]            ,  [5, 1, 5]          ,
    [0, 2, 0]            ,  [0, 2, 0]          ,
    [1]                  ,  [1]                ,
    [0]                  ,  [0]                ,
    []                   ,  []                 ,
    [7, 0, 4, 3, 0, 2]   ,  [7, 3, 4, 3, 0, 2] ,
    [7, 0, 4, 3, 0, 1]   ,  [7, 3, 4, 3, 1, 1] ,
    [7, 0, 4, 3, 0, 0]   ,  [7, 3, 4, 3, 0, 0] ,
    [7, 0, 1, 0, 0, 7]   ,  [7, 7, 1, 7, 7, 7] ,
  ].each_slice 2 do |input,output|
    it "should return #{output.inspect} when given #{input.inspect}" do
      zero_max(input).should == output
    end
  end
end