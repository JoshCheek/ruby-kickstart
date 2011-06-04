describe 'reverse_map' do
  
  it 'should have defined a reverse_map method' do
    method(:reverse_map).should be
  end
  
  specify '( 1, 2, 3 ) { |i| i * 2 } # => [6, 4, 2]' do
    reverse_map( 1, 2, 3 ) { |i| i * 2 }.should == [6, 4, 2]
  end
  
  specify '{} # => []' do
    reverse_map {}.should == []
  end
  
  specify '# => []' do
    reverse_map.to_a.should == []
  end
  
  specify '("a", "b", "c") { |char| char * 3 } # => ["ccc", "bbb", "aaa"]' do
    reverse_map("a", "b", "c") { |char| char * 3 }.should == ["ccc", "bbb", "aaa"]
  end
  
  specify '(*1..1000) { |i| i * i } # => [1000000, 998001, ..., 9, 4, 1]' do
    reverse_map(*1..1000) { |i| i * i }.should == (1..1000).to_a.reverse.map { |i| i * i }
  end
  
end