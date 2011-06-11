require 'date'
require 'pathname'

describe 'longest_method' do
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
    it "should return #{expected.inspect} for #{object.inspect}" do
      longest_method(object).should == expected
    end
  end
end