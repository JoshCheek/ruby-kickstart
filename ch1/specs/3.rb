describe 'ten_twenty' do
  
  it 'should return 20 when passed 5' do
    ten_twenty(5).should == 20
  end
  
  it 'should return 10 when passed 6' do
    ten_twenty(6).should == 10
  end
  
  it 'should pass other tests' do
    10.downto -10 do |i|
      ten_twenty(i).should == 10 if i.even?
      ten_twenty(i).should == 20 unless i.even?
    end
  end
  
end