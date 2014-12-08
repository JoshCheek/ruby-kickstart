require 'date'

RSpec.describe 'longest_method' do
  [ 1,
    2,
    2**1000,
    "abc",
    /abc/,
    Object.new,
    Object,
    Class,
    Class.new,
    Date.today,
    Pathname.new('.'),
    Time.now,
    Object.new.instance_eval { def this_is_a_really_really_really_really_really_long_method_name; end; self },
  ].each do |object|
    # This might be cheating, but I'm hesitant to hard code something in here,
    # given that it could change as Ruby changes.
    expected = object.methods.max_by(&:length)
    it "returns #{expected.inspect} for #{object.inspect}" do
      actual = longest_method(object)
      expect(actual).to eq expected
    end
  end
end
