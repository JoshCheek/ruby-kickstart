describe 'count_YZ' do

  it 'should return 2 when given count_YZ("fez day")' do
    count_YZ("fez day").should == 2
  end

  it 'should return 2 when given count_YZ("day fez")' do
    count_YZ("day fez").should == 2
  end
  
  it 'should return 2 when given count_YZ("day fyyyz")' do
    count_YZ("day fyyyz").should == 2
  end
  
  it 'should return 1 when given count_YZ("day yak")' do
    count_YZ("day yak").should == 1
  end

  it 'should return 1 when given count_YZ("day:yak")' do
    count_YZ("day:yak").should == 1
  end

  it 'should return 2 when given count_YZ("!!day--yaz!!")' do
    count_YZ("!!day--yaz!!").should == 2
  end

  it 'should return 0 when given count_YZ("yak zak")' do
    count_YZ("yak zak").should == 0
  end

  it 'should return 2 when given count_YZ("DAY abc XYZ")' do
    count_YZ("DAY abc XYZ").should == 2
  end
  
  it 'should return 3 when given count_YZ("aaz yyz my")' do
    count_YZ("aaz yyz my").should == 3
  end

  it 'should return 2 when given count_YZ("y2bz")' do
    count_YZ("y2bz").should == 2
  end

  it 'should return 1 when given count_YZ("yAbz")' do
    count_YZ("yAbz").should == 1
  end


  it 'should return 0 when given count_YZ("zxyx")' do
    count_YZ("zxyx").should == 0
  end

end