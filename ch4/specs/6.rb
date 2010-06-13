describe 'count_triple' do
  
  it 'should return 1 when invoked with count_triple("abcXXXabc")' do
    count_triple("abcXXXabc").should == 1
  end
  
  it 'should return 3 when invoked with count_triple("xxxabyyyycd")' do
    count_triple("xxxabyyyycd").should == 3
  end
  
  it 'should return 0 when invoked with count_triple("a")' do
    count_triple("a").should == 0
  end
  
  it 'should return 0 when invoked with count_triple("")' do
    count_triple("").should == 0
  end
  
  it 'should return 1 when invoked with count_triple("XXXabc")' do
    count_triple("XXXabc").should == 1
  end
  
  it 'should return 2 when invoked with count_triple("XXXXabc")' do
    count_triple("XXXXabc").should == 2
  end
  
  it 'should return 3 when invoked with count_triple("XXXXXabc")' do
    count_triple("XXXXXabc").should == 3
  end
  
  it 'should return 3 when invoked with count_triple("222abyyycdXXX")' do
    count_triple("222abyyycdXXX").should == 3
  end
  
  it 'should return 4 when invoked with count_triple("abYYYabXXXXXab")' do
    count_triple("abYYYabXXXXXab").should == 4
  end
  
  it 'should return 0 when invoked with count_triple("abYYXabXXYXXab")' do
    count_triple("abYYXabXXYXXab").should == 0
  end
  
  it 'should return 0 when invoked with count_triple("abYYXabXXYXXab")' do
    count_triple("abYYXabXXYXXab").should == 0
  end
  
  it 'should return 1 when invoked with count_triple("122abhhh2")' do
    count_triple("122abhhh2").should == 1
  end
  
end
