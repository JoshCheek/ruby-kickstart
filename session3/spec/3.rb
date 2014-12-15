RSpec.describe 'word_count' do
  it 'is defined' do
    expect(method :word_count).to be
  end

  it 'returns an empty hash when given an empty string' do
    expect(word_count "").to eq Hash.new
  end

  it 'returns {"the" => 2, "dog" => 1, "and" => 1, "cat" => 1} when given "The dog and the cat"' do
    expect(word_count "The dog and the cat")
      .to eq "the" => 2, "dog" => 1, "and" => 1, "cat" => 1
  end

  [ ["ThAt C b c c thAt b thaT",                                                                                        {"that"=>3, "c"=>3, "b"=>2}],
    ["other c THiS c This",                                                                                             {"other"=>1, "c"=>2, "this"=>2}],
    ["c This oTheR c othER A THIS a b b that OtheR A C A c That b tHAt ThIs B tHaT B a c THAt c A",                     {"c"=>6, "this"=>3, "other"=>3, "a"=>6, "b"=>5, "that"=>5}],
    ["A B B ThAt otHEr B C that OTHEr ThiS ThAt tHis B a",                                                              {"a"=>2, "b"=>4, "that"=>3, "other"=>2, "c"=>1, "this"=>2}],
    ["otheR tHIS OthEr B b a oTHeR ThIs b C THat b thaT thAt oTheR thiS b",                                             {"other"=>4, "this"=>3, "b"=>5, "a"=>1, "c"=>1, "that"=>3}],
    ["OTheR B THAT ThIs b thAT tHat ThAt tHat tHaT ThaT a A C c thAT oTher thAt",                                       {"other"=>2, "b"=>2, "that"=>9, "this"=>1, "a"=>2, "c"=>2}],
    ["tHAt thAt b otheR ThIs OThEr c b ThIs A c thiS tHIs b a other b tHAT c B b oTher A thIS thIS that A other OthER", {"that"=>4, "b"=>6, "other"=>6, "this"=>6, "c"=>3, "a"=>4}],
    ["oTheR OtHEr c A OthEr c b B ThIS that b a OtHer b thAT A B",                                                      {"other"=>4, "c"=>2, "a"=>3, "b"=>5, "this"=>1, "that"=>2}],
    ["A B C THaT A a Other OTher c c otHeR thaT this a c",                                                              {"a"=>4, "b"=>1, "c"=>4, "that"=>2, "other"=>3, "this"=>1}],
    ["B b a ThAt A C ThAt tHAt tHat a oThEr a A OTHEr C",                                                               {"b"=>2, "a"=>5, "that"=>4, "c"=>2, "other"=>2}],
  ].each do |string, result|
    it "returns #{result.inspect} when given #{string.inspect}" do
      expect(word_count string).to eq result
    end
  end
end
