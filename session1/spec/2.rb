RSpec.describe "arithmetic2" do
  let(:test_array) {
    [ -7, -6, -3.5,
       1, -1, -0.5,
      -1,  1, -0.5,
      -1, -1, -0.5,
       0,  0,  0.0,
       0, 100, 0.0,
    ]
  }

  it 'returns 0.5 when give 1 , 2' do
    expect(arithmetic2 1, 2).to eq 0.5
  end

  it 'returns 5.0 when given 19 , 10' do
    expect(arithmetic2 19, 10).to eq 5.0
  end

  it 'returns -3.5 when given -6 , -7' do
    expect(arithmetic2 -6, -7).to eq -3.5
  end

  it 'returns pass the test array' do
    test_array.each_slice 3 do |a, b, result|
      expect(arithmetic2 a, b).to eq result
    end
  end
end
