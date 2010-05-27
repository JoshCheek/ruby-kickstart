describe '7 array' do
  
  [
    [3, 1, 3, 1, 3]           , true  ,		    
    [3, 1, 3, 3]              , false	,	    
    [3, 4, 3, 3, 4]           , false	,	    
    [1, 3, 1, 3, 1, 2]        , false	,	    
    [1, 3, 1, 3, 1, 3]        , true	,	    
    [1, 3, 3, 1, 3]           , false	,	    
    [1, 3, 1, 3, 1, 3, 4, 3]  , false	,	    
    [3, 4, 3, 4, 3, 4, 4]     , true	,	    
    [3, 3, 3]                 , false	,	    
    [1, 3]                    , false	,	    
    [3]                       , false	,	    
    [1]                       , false	,
    []                        , false ,
  ].each_slice 2 do |input,output|
    it "should return #{output.inspect} given #{input.inspect}" do
      have_three( input ).should == output
    end
  end
  
end