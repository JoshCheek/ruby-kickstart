RSpec.describe 'your_sort' do
  def sort_normal(ary)
    your_sort(ary) { |a, b| a <=> b }
  end

  example 'empty array is already sorted' do
    expect(sort_normal []).to eq []
  end

  example 'array with 1 element is already sorted' do
    expect(sort_normal [12]).to eq [12]
  end

  example 'array with 2 elements' do
    expect(sort_normal [1, 2]).to eq [1, 2]
    expect(sort_normal [2, 1]).to eq [1, 2]
  end

  example 'array with 3 elements' do
    expect(sort_normal [1, 2, 3]).to eq [1, 2, 3]
    expect(sort_normal [1, 3, 2]).to eq [1, 2, 3]
    expect(sort_normal [2, 1, 3]).to eq [1, 2, 3]
    expect(sort_normal [2, 3, 1]).to eq [1, 2, 3]
    expect(sort_normal [3, 1, 2]).to eq [1, 2, 3]
    expect(sort_normal [3, 2, 1]).to eq [1, 2, 3]
  end

  example 'array with many elements' do
    result = your_sort([24, 0, 68, 44, 68, 47, 42, 66, 89, 22]) { |a, b| a <=> b }
    expect(result).to eq [0, 22, 24, 42, 44, 47, 66, 68, 68, 89]
  end

  it 'compares with <=> when no block submitted' do
    result = your_sort([24, 0, 68, 44, 68, 47, 42, 66, 89, 22])
    expect(result).to eq [0, 22, 24, 42, 44, 47, 66, 68, 68, 89]
  end

  it 'can be provided with a with a block for comparing in a different way' do
    result = your_sort([24, 0, 68, 44, 68, 47, 42, 66, 89, 22]) { |a, b| b <=> a }
    expect(result).to eq [89, 68, 68, 66, 47, 44, 42, 24, 22, 0]
  end

  it 'can sort an array of non-numbers' do
    result = your_sort ['c', 'a', 'b']
    expect(result).to eq ['a', 'b', 'c']
  end

  example 'example: sorting words by their second character (breaking ties with first char)' do
    result = your_sort %w(The quick brown fox jumps over the lazy dog) do |a, b|
      if    a[1] < b[1] then -1
      elsif a[1] > b[1] then  1
      elsif a[0] < b[0] then -1
      elsif a[0] > b[0] then  1
      elsif a == b      then  0
      else raise "This shouldn't happen, given our input words!"
      end
    end
    expect(result).to eq %w(lazy The the dog fox brown jumps quick over)
  end

  example 'grouping types within a non-homogeneous array, having the groups internally sorted' do
    result = your_sort [2.5, 'r', 1, 4, 'a', 9, 3, 9.0, 'm', 25.8] do |a,b|
      a_class_val = [String, Fixnum, Float].index(a.class)
      b_class_val = [String, Fixnum, Float].index(b.class)
      if a_class_val == b_class_val
        a <=> b
      else
        a_class_val <=> b_class_val
      end
    end
    expect(result).to eq ["a", "m", "r",
                          1, 3, 4, 9,
                          2.5, 9.0, 25.8]
  end
end
