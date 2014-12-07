RSpec.describe 'staircase' do
  it 'is defined' do
    expect(method :staircase).to be
  end

  [ [1, { 1 => [] }],
    [2, { 1 => [] }],
    [3, { 1 => [], 3 => [2] }],
    [4, { 1 => [], 3 => [2] }],
    [5, { 1 => [], 3 => [2], 5 => [2, 4] }],
    [6, { 1 => [], 3 => [2], 5 => [2, 4] }],
    [7, { 1 => [], 3 => [2], 5 => [2, 4], 7 => [2, 4, 6] }],
  ].each do |n, result|
    specify "staircase(#{n}) # => #{result.inspect}" do
      expect(staircase n).to eq result
    end
  end
end
