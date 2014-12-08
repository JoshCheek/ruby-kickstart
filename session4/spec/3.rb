RSpec.describe 'passthrough' do
  it 'returns what is passed in, if the enum is empty' do
    result = passthrough([], :passed_in) { |a, b| :from_block }
    expect(result).to eq :passed_in
  end

  it 'summing 5..10, starting at 0, returns 45' do
    result = passthrough(5..10, 0) { |sum, num| sum + num }
    expect(result).to eq  45
  end

  it 'summing 5..10 from 0 again, but checking params this time' do
    expected_params = [
       0,  5,
       5,  6,
      11,  7,
      18,  8,
      26,  9,
      35, 10,
    ]
    actual_params = []
    result = passthrough 5..10, 0 do |sum, num|
      actual_params << sum << num
      sum + num
    end
    expect(actual_params).to eq expected_params
  end

  it '"the fox and the hound ran all around", with words aggregated by length' do
    result = passthrough %w(the fox and the hound ran all around), Hash.new do |words, word|
      words[word.length] ||= Array.new
      words[word.length] << word
      words
    end
    expect(result).to eq 5 => ["hound"],
                         6 => ["around"],
                         3 => ["the", "fox", "and", "the", "ran", "all"]
  end

  it 'passing a hash in, and expanding it to names' do
    married_couples = {'Smith' => ['John', 'Sally'], 'Jones' => ['Will', 'Robert']}
    people = passthrough married_couples, Array.new do |people, (last_name, first_names)|
      full_names = first_names.map { |first_name| "#{first_name} #{last_name}" }
      people + full_names
    end
    expect(people).to eq ["John Smith", "Sally Smith", "Will Jones", "Robert Jones"]
  end
end
