# Given an array of elements
# return a new array length 2 containing the first and last elements from the original array.
# The original array will be length 1 or more.
# 
# make_ends( [1, 2, 3]    )                     # =>  [1, 3]
# make_ends( [1, 2, 3, 4] )                     # =>  [1, 4]
# make_ends( [7, 4, 6, 2] )                     # =>  [7, 2]
# make_ends( %w[the quick brown fox] )          # =>  ['the', 'fox']
# make_ends( [/r/ , /e/ , /g/ , /e/ , /x/] )    # =>  [/r/, /x/]

describe 'make_ends' do
  
  it 'should return [1,3] when given [1,2,3]' do
    make_ends([1,2,3]).should == [1,3]
  end
  
  it 'should return [1, 4] when given [1, 2, 3, 4]' do
    make_ends([1,2,3,4]).should == [1,4]
  end
  
  it 'should return [7, 2] when given [7, 4, 6, 2]' do
    make_ends([7,4,6,2]).should == [7,2]
  end
  
  it 'should return ["the", "fox"] when given %w[the quick brown fox]' do
    make_ends(%w[the quick brown fox]).should == %w[the fox]
  end

  it 'should return [/r/, /x/] when given [/r/ , /e/ , /g/ , /e/ , /x/]' do
    make_ends([/r/ , /e/ , /g/ , /e/ , /x/]).should == [/r/, /x/]
  end
  
  it 'should return ["abc",9.2] when given ["abc" , "def" , /ghi/ , 2 , 3 , 9.2]' do
    make_ends(["abc" , "def" , /ghi/ , 2 , 3 , 9.2]).should == ["abc",9.2]
  end

end