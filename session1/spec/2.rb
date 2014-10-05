describe "arithmetic2" do
  let(:test_array) {[-7, -6, -3.5,
    1, -1, -0.5,
    -1,  1, -0.5,
    -1, -1, -0.5,
    0,  0,  0.0,
    0, 100, 0.0
  ]}

  it 'should return 0.5 when give 1 , 2' do
    expect(arithmetic2(1, 2)).to be_eql 0.5
  end

  it 'should return 5.0 when given 19 , 10' do
    expect(arithmetic2(19, 10)).to be_eql 5.0
  end

  it 'should return -3.5 when given -6 , -7' do
    expect(arithmetic2(-6, -7)).to be_eql(-3.5)
  end

  it 'should return pass the test array' do
    test_array.each_slice 3 do |a, b, result|
      expect(arithmetic2(a, b)).to be_eql result
    end
  end

end
