describe "pirates_say_arrrrrrrrr" do

  it 'should return "eeu" when given "are you really learning Ruby?"' do
    expect(pirates_say_arrrrrrrrr('are you really learning Ruby?')).to be_eql 'eenu'
  end

  it 'should return "rya" when given "Katy Perry is on the radio!"' do
    expect(pirates_say_arrrrrrrrr('Katy Perry is on the radio!')).to be_eql 'rya'
  end

  it 'should return "arrrrrrrr" when given "Pirates say arrrrrrrrr"' do
    expect(pirates_say_arrrrrrrrr('Pirates say arrrrrrrrr')).to be_eql 'arrrrrrrr'
  end

  it 'should return "12" when given "r1r2r"' do
    expect(pirates_say_arrrrrrrrr('r1r2r')).to be_eql '12'
  end

  it 'should return "" when given ""' do
    expect(pirates_say_arrrrrrrrr('')).to be_eql ''
  end

  it 'should return "" when given "Quickly she consumed the apple."' do
    expect(pirates_say_arrrrrrrrr('Quickly she consumed the apple.')).to be_eql ''
  end

end
