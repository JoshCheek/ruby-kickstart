RSpec.describe 'count_clumps' do
  def self.assert_counts(expected_count, array)
    it "counts #{expected_count} clumps in #{array.inspect}" do
      actual_count = count_clumps(*array)
      expect(actual_count).to eq expected_count
    end
  end
  assert_counts 2, [1, 2, 2, 3, 4, 4]
  assert_counts 2, [1, 1, 2, 1, 1]
  assert_counts 1, [1, 1, 1, 1, 1]
  assert_counts 0, [1, 2, 3]
  assert_counts 4, [2, 2, 1, 1, 1, 2, 1, 1, 2, 2]
  assert_counts 4, [0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2]
  assert_counts 5, [0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2]
  assert_counts 5, [0, 0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2]
  assert_counts 0, []
end

RSpec.describe 'same_ends' do
  def self.assert_ends(ends_are_same, end_length, array)
    example "in #{array.inspect}, with end length #{end_length}, they ARE#{' NOT' unless ends_are_same} the same" do
      result = same_ends(end_length, *array)
      expect(result).to eq ends_are_same
    end
  end

  assert_ends false, 1, [5, 6, 45, 99, 13, 5, 6]
  assert_ends true,  2, [5, 6, 45, 99, 13, 5, 6]
  assert_ends false, 3, [5, 6, 45, 99, 13, 5, 6]
  assert_ends true,  1, [1, 2, 5, 2, 1]
  assert_ends false, 2, [1, 2, 5, 2, 1]
  assert_ends true,  0, [1, 2, 5, 2, 1]
  assert_ends true,  5, [1, 2, 5, 2, 1]
  assert_ends true,  0, [1, 1, 1]
  assert_ends true,  1, [1, 1, 1]
  assert_ends true,  2, [1, 1, 1]
  assert_ends true,  3, [1, 1, 1]
  assert_ends true,  1, [1]
  assert_ends true,  0, []
  assert_ends false, 1, [4, 2, 4, 5]
  assert_ends false, 2, [1]
  assert_ends false, 1, []
end


RSpec.describe 'problem_14 with :problem => :count_clumps' do
  def self.assert_counts(expected_count, array)
    it "counts #{expected_count} clumps in #{array.inspect}" do
      actual_count = problem_14(*array, :problem => :count_clumps)
      expect(actual_count).to eq expected_count
    end
  end
  assert_counts 2, [1, 2, 2, 3, 4, 4]
  assert_counts 2, [1, 1, 2, 1, 1]
  assert_counts 1, [1, 1, 1, 1, 1]
  assert_counts 0, [1, 2, 3]
  assert_counts 4, [2, 2, 1, 1, 1, 2, 1, 1, 2, 2]
  assert_counts 4, [0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2]
  assert_counts 5, [0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2]
  assert_counts 5, [0, 0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2]
  assert_counts 0, []
end

RSpec.describe 'problem_14 with :problem => :same_ends' do
  def self.assert_ends(ends_are_same, end_length, array)
    example "in #{array.inspect}, with end length #{end_length}, they ARE#{' NOT' unless ends_are_same} the same" do
      result = problem_14(end_length, *array, :problem => :same_ends)
      expect(result).to eq ends_are_same
    end
  end
  assert_ends false, 1, [5, 6, 45, 99, 13, 5, 6]
  assert_ends true,  2, [5, 6, 45, 99, 13, 5, 6]
  assert_ends false, 3, [5, 6, 45, 99, 13, 5, 6]
  assert_ends true,  1, [1, 2, 5, 2, 1]
  assert_ends false, 2, [1, 2, 5, 2, 1]
  assert_ends true,  0, [1, 2, 5, 2, 1]
  assert_ends true,  5, [1, 2, 5, 2, 1]
  assert_ends true,  0, [1, 1, 1]
  assert_ends true,  1, [1, 1, 1]
  assert_ends true,  2, [1, 1, 1]
  assert_ends true,  3, [1, 1, 1]
  assert_ends true,  1, [1]
  assert_ends true,  0, []
  assert_ends false, 1, [4, 2, 4, 5]
end

RSpec.describe 'problem_14 with no hash on the end uses count_clumps' do
  it 'counts 2 clumps in 1, 1, 2, 1, 1' do
    expect(problem_14(1, 1, 2, 1, 1)).to eq 2
  end
  it 'counts 0 clumps when given no args' do
    expect(problem_14).to eq 0
  end
end
