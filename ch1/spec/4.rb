describe 'has_teen' do
  
  it 'should return true for 13 , 20 , 10' do
    has_teen(13,20,10).should be_true
  end
  
  it 'should return true for 20 , 19 , 10' do
    has_teen(20,19,10).should be_true
  end
  
  it 'should return true for 20 , 10 , 13' do
    has_teen(20,10,13).should be_true
  end
    
    
  [ 12          ,          12 ,      12 ,
    29          ,          20 ,      20 ,
    113         ,        1015 ,      25 ,
    10000000000 , -1000000000 , 8932475
  ].each_slice 3 do |a,b,c|
    it "should return false for #{a} , #{b} , #{c}" do
      has_teen(a,b,c).should be_false
    end
  end

  (13..19).zip( *Array.new(2) {1..7} ).each do |a,b,c|
    it "should return true for #{a} , #{b} , #{c}" do
      has_teen(a,b,c).should be_true
    end
  end
  
end