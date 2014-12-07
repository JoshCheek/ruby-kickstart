RSpec.describe 'reverse_map' do
  it 'defined a reverse_map method' do
    expect(method :reverse_map).to be
  end

  specify 'reverse_map(1, 2, 3) { |i| i * 2 } # => [6, 4, 2]' do
    times_2 = reverse_map(1, 2, 3) { |i| i * 2 }
    expect(times_2).to eq [6, 4, 2]
  end

  specify 'reverse_map {} # => []' do
    expect(reverse_map {}).to eq []
  end

  specify 'reverse_map # => []' do
    expect(reverse_map.to_a).to eq []
  end

  specify 'reverse_map("a", "b", "c") { |char| char * 3 } # => ["ccc", "bbb", "aaa"]' do
    expect(reverse_map("a", "b", "c") { |char| char * 3 }).to eq ["ccc", "bbb", "aaa"]
  end

  specify 'reverse_map(*1..1000) { |i| i * i } # => [1000000, 998001, ..., 9, 4, 1]' do
    expected = (1..1000).to_a.reverse.map { |i| i * i }
    actual   = reverse_map(*1..1000) { |i| i * i }
    expect(actual).to eq expected
  end
end
