describe 'staircase' do
  
  it 'should be defined' do
    method(:staircase).should be
  end

  [
    1, { 1 => [] },
    2, { 1 => [] },
    3, { 1 => [], 3 => [2] },
    4, { 1 => [], 3 => [2] },
    5, { 1 => [], 3 => [2], 5 => [2, 4] },
    6, { 1 => [], 3 => [2], 5 => [2, 4] },
    7, { 1 => [], 3 => [2], 5 => [2, 4], 7 => [2, 4, 6] },
  ].each_slice 2 do |n, result|
    specify "#{n} # => #{result.inspect}" do
      staircase(n).should == result
    end
  end

end
