RSpec.describe 'array_init' do
  example "array_init(2) { |i| i.to_s } # => ['0', '1']" do
    actual = array_init(2) { |i| i.to_s }
    expect(actual).to eq ['0', '1']
  end

  example "array_init { |i| i.to_s } # => ['0', '1', '2', '3', '4']" do
    actual = array_init { |i| i.to_s }
    expect(actual).to eq ['0', '1', '2', '3', '4']
  end

  example "array_init(2) # => ['0', '100']" do
    actual = array_init(2)
    expect(actual).to eq ['0', '100']
  end

  example "array_init # => ['0', '100', '200', '300', 400']" do
    actual = array_init
    expect(actual).to eq ['0', '100', '200', '300', '400']
  end

  example "array_init { 'hi } # => [ 'hi', 'hi', 'hi', 'hi']" do
    actual = array_init { 'hi' }
    expect(actual).to eq ['hi', 'hi', 'hi', 'hi', 'hi']
  end

  example "array_init(100){ 'hi' } # => ['hi'] * 100" do
    actual = array_init(100) { 'hi' }
    expect(actual).to eq ['hi'] * 100
  end

  it 'works for a more complicated block' do
    actual = array_init 10 do |i|
      if i % 2 == 0
        i * 200
      else
        i * -5
      end
    end
    expect(actual).to eq [0, -5, 400, -15, 800, -25, 1200, -35, 1600, -45]
  end
end
