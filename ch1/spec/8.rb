describe 'sum_limit' do  
  [ 2         ,  3     ,  5         ,
    8         ,  3     ,  8         ,
    8         ,  1     ,  9         ,
    11        ,  39    ,  50        ,
    11        ,  99    ,  11        ,
    0         ,  0     ,  0         ,
    99        ,  0     ,  99        ,
    99        ,  1     ,  99        ,
    123       ,  1     ,  124       ,
    1         ,  123   ,  1         ,
    23        ,  60    ,  83        ,
    23        ,  80    ,  23        ,
    9000      ,  1     ,  9001      ,
    90000000  ,  1     ,  90000001  ,
    9000      ,  1000  ,  9000      ].each_slice 3 do |a,b,result|
    it "should return #{result} when given #{a} , #{b}" do
      sum_limit(a,b).should == result
    end
  end
end