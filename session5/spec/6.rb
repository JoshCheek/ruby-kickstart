RSpec.describe 'bar_regex' do
  def self.assert_finds(str, result)
    example "#{str.inspect}[bar_regex] # => #{result.inspect}" do
      result = str[bar_regex]
      expect(result).to eq result
    end
  end

  def self.assert_size(str, size)
    example "#{str.inspect}.scan(bar_regex).size # => #{size}" do
      matches = str.scan(bar_regex)
      expect(matches.size).to eq size
    end
  end

  assert_finds "bar",            'bar'
  assert_size  "bar at the bar", 2
  assert_finds "ba\nr",          nil
  assert_finds "Bar",            'Bar'
  assert_finds "bAr",            nil
  assert_finds "BAR",            nil
  assert_finds "Barrier",        nil
  assert_finds "lowbar",         nil
  assert_size  "bar Bar bar.bar", 4
end
