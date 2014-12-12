RSpec.describe 'List' do
  specify '<< operator adds items' do
    expect { List.new << 1 }.to_not raise_error
  end

  it 'returns itself so that it can be chained like list << 1 << "a"' do
    list = List.new
    expect(list << 1 << "a").to equal list
  end

  specify '#each passes its elements' do
    list = List.new << 'a' << 'b'
    results = []
    list.each { |element| results << element }
    expect(results).to eq ['a', 'b']
  end

  it 'inspects prettily' do
    list = List.new
    expect(list.inspect).to eq '#<List: >'
    list << 1
    expect(list.inspect).to eq '#<List: 1>'
    list << 5 << 3 << 4 << 2
    expect(list.inspect).to eq '#<List: 1, 5, 3, 4, 2>'
  end

  it 'includes Enumerable methods' do
    list = List.new << 1 << 5 << 3 << 4 << 2
    expect(list.max).to eq 5
    expect(list.min).to eq 1
    expect(list.select &:odd?).to eq [1, 5, 3]
    expect(list.count).to eq 5
    expect(list.find { |num| num * 5 == 20 }).to eq 4
    expect(list.find { |num| num * 5 == 21 }).to eq nil
  end
end
