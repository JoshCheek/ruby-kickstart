def should_see(ary_of_arys, expected)
  seen = []
  spiral_access(ary_of_arys) { |element| seen << element }
  seen.should == expected
end

describe 'spiral_access' do
  
  it 'should be defined' do
    method(:spiral_access).should be
  end
  
  it 'should not call any blocks when given [[]]' do
    Proc.new { spiral_access([[]]) { raise "You invoked the block" } }.should_not raise_error
  end
  
  it 'should yield 1 when given [[1]]' do
    should_see [[1]], [1]
  end
  
  it 'should yield 1,2,3,4 when given [[1,2],[4,3]]' do
    should_see [[1,2],[4,3]], [1,2,3,4]
  end
  
  
  it 'should yield 1,2,3,4,5,6 when given [[1,2,3],[8,9,4],[7,6,5]]' do
    should_see [[1,2,3],[6,5,4]], [1,2,3,4,5,6]
  end
    
  it 'should fit the example given in the notes' do
    should_see [
      [  1 ,  2 ,  3 ,  4 , 5 ],
      [ 16 , 17 , 18 , 19 , 6 ],
      [ 15 , 24 , 25 , 20 , 7 ],
      [ 14 , 23 , 22 , 21 , 8 ],
      [ 13 , 12 , 11 , 10 , 9 ],
    ], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]
  end
  
  it 'should yield 1 through 36 when given a six by six array, populated in the order of traversal' do
    should_see [
      [  1 ,  2 ,  3 ,  4 ,  5 ,  6 ],
      [ 20 , 21 , 22 , 23 , 24 ,  7 ],
      [ 19 , 32 , 33 , 34 , 25 ,  8 ],
      [ 18 , 31 , 36 , 35 , 26 ,  9 ],
      [ 17 , 30 , 29 , 28 , 27 , 10 ],
      [ 16 , 15 , 14 , 13 , 12 , 11 ],
    ], (1..36).to_a
  end
  
end

