RSpec.describe 'first_pos' do
  it 'is defined' do
    expect(method :first_pos).to be
  end

  it 'returns an empty hash when given an empty string' do
    expect(first_pos "").to eq Hash.new
  end


  [ ["The dog and the cat and the cow",                                                                                      { "The" => 0, "dog" => 1, "and" => 2, "the" => 3, "cat" => 4, "cow" => 7 }],
    ["This is the house that Jack built",                                                                                    {"This" => 0, "is" => 1, "the" => 2, "house" => 3, "that" => 4, "Jack" => 5, "built" => 6}],
    ["other c b b a other c that a this a c",                                                                                {"other"=>0, "c"=>1, "b"=>2, "a"=>4, "that"=>7, "this"=>9}],
    ["c other other c c this that other b",                                                                                  {"c"=>0, "other"=>1, "this"=>5, "that"=>6, "b"=>8}],
    ["this b c other a other that this a this b a that that that",                                                           {"this"=>0, "b"=>1, "c"=>2, "other"=>3, "a"=>4, "that"=>6}],
    ["a b other c c that b that b a c a that a other c c c c c this c b this",                                               {"a"=>0, "b"=>1, "other"=>2, "c"=>3, "that"=>5, "this"=>20}],
    ["other a this c other other",                                                                                           {"other"=>0, "a"=>1, "this"=>2, "c"=>3}],
    ["that that b that other",                                                                                               {"that"=>0, "b"=>2, "other"=>4}],
    ["b other this this c that that b this this this that other other this this b a b this a other other b",                 {"b"=>0, "other"=>1, "this"=>2, "c"=>4, "that"=>5, "a"=>17}],
    ["that this other c this c this other a this b a this b that other",                                                     {"that"=>0, "this"=>1, "other"=>2, "c"=>3, "a"=>8, "b"=>10}],
    ["a this that c a a b b c a c a a other that",                                                                           {"a"=>0, "this"=>1, "that"=>2, "c"=>3, "b"=>6, "other"=>13}],
    ["this c a other b this that that this that other c c that other a other other other other a that this a a c c other c", {"this"=>0, "c"=>1, "a"=>2, "other"=>3, "b"=>4, "that"=>6}],
  ].each do |str, result|
    it "returns #{result.inspect} when given #{str.inspect}" do
      expect(first_pos str).to eq result
    end
  end
end
