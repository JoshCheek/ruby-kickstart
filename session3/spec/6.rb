RSpec.describe 'match_maker' do |variable|
  when_true = [
    [[true  , true                ],[false]],
    [[false , false               ],[false]],
    [[false , true                ],[true]],
    [[true  , false               ],[true]],
    [[true  , true, false, true   ],[false, true]],
    [[true  , true, false, nil    ],[false, false]],
    [[true  , true, true, nil     ],[false, true]],
    [[true  , true, 0, nil        ],[false, true]],
    [[                            ],[]],
    [[false, false, false, nil, false, "abc", 6, nil, nil, nil, 1, 1, :abc, false, false, false, nil, false, :abc, /abc/, false, false, Object.new, false, 5, 5], [false, false, true, true, false, false, true, false, false, false, false, true, false]],
    [[6, false, false, false, 1, nil, false, /abc/, Class.new, false, 1, nil, false, 1, false, false, true, 2], [true, false, true, true, true, true, true, false, false]],
    [[nil, Class.new, nil, 3, false, Class.new, false, false, 6, 2, Class.new, false, false, nil, 5, Object.new, nil, false, 4, nil, Object.new, nil, :abc, false], [true, true, true, false, false, true, false, false, false, true, true, true]],
    [[false, nil, nil, Object.new, 6, nil, nil, Object.new, 4, nil, :abc, 1, 3, /abc/, false, false, /abc/, 5, /abc/, false, "abc", false, false, 6, false, 4, false, false], [false, true, true, true, true, false, false, false, false, true, true, true, true, false]],
    [[Object.new, false, 5, false, 1, true, "abc", /abc/, false, false, 5, 3, Object.new, false, Object.new, nil, false, 7, 4, 3, false, 3, 2, false, nil, false, 3, false, nil, nil], [true, true, false, false, false, false, true, true, true, false, true, true, false, true, false]],
    [[false, 7, 7, nil, false, 6, false, Object.new, 4, nil, 4, nil], [true, true, true, true, true, true]],
    [[nil, Class.new, false, nil, false, 3, 5, Object.new, false, 3, Class.new, false, nil, 4, nil, 5, Object.new, nil, nil, :abc, false, Class.new, Object.new, nil], [true, false, true, false, true, true, true, true, true, true, true, true]],
    [[6, nil, "abc", 5, 5, Object.new, 5, nil, false, :abc, true, false, Class.new, true, true, 2, 7, 6], [true, false, false, true, true, true, false, false, false]],
    [[false, false, Object.new, false, false, :abc, nil, 2, false, nil, 6, nil, 7, nil, false, "abc"], [false, true, true, true, false, true, true, true]],
    [[/abc/, nil, "abc", 6, 5, nil, :abc, "abc", false, :abc, true, false, nil, nil, 1, nil, false, Object.new], [true, false, true, false, true, true, false, true, true]],
  ]

  # cases when first arg is true
  all_cases = when_true.map do |args, expectations|
    args = [true].concat args
    [args, expectations]
  end

  # cases when first arg is false
  all_cases += when_true.map do |args, expectations|
    args = [false].concat args
    expectations = expectations.map { |expectation| !expectation }
    [args, expectations]
  end

  all_cases.each do |args, expectations|
    it "returns #{expectations.inspect} when given #{args.inspect}" do
      expect(match_maker(*args)).to eq expectations
    end
  end

end
