describe "arithmetic1" do
  it 'should return 30 when passed 10' do
    expect(arithmetic1(10)).to be_eql 30
  end

  it 'should return 32.5 when passed 10.5' do
    expect(arithmetic1(10.5)).to be_eql 32.5
  end

  it 'should return -50 when passed -6' do
    expect(arithmetic1(-6)).to be_eql(-50)
  end

  it 'should return 480 when passed 100' do
    expect(arithmetic1(100)).to be_eql 480
  end
end
