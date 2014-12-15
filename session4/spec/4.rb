RSpec.describe 'first_object' do
  def self.assert_first(first, args)
    example "first_object(#{args.map(&:inspect).join(", ")}) # => #{first.inspect}" do
      obj = first_object(*args)
      expect(obj).to eq first
    end
  end

  assert_first 1,    [1, nil, nil]
  assert_first 1,    [nil, 1, nil]
  assert_first 1,    [nil, nil, 1]
  assert_first 1,    [nil, 1, 2]
  assert_first nil,  [nil, nil, nil]
  assert_first nil,  [false, false, false]
  assert_first true, [false, false, true]
  assert_first 5,    [5, 4, 3]
  assert_first 5,    [5, nil, 3]
  assert_first 5,    [5, 4, nil]
end
