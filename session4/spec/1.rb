RSpec.describe 'Stack#inspect' do
  let(:stack) { Stack.new }

  example 'initially is ()' do
    expect(stack.inspect).to eq "()"
  end

  example 'after pushing 1: (1)' do
    stack.push 1
    expect(stack.inspect).to eq '(1)'
  end

  example 'after pushing a hash: ({1=>2})' do
    stack.push({1=>2})
    expect(stack.inspect).to eq '({1=>2})'
  end

  example 'after pushing 1, then 2, then 3: (3)2)1)' do
    (1..3).each { |i| stack.push i }
    expect(stack.inspect).to eq '(3)2)1)'
  end

  example 'after pushing 1 through 5: (5)4)3)2)1)' do
    (1..5).each { |i| stack.push i }
    expect(stack.inspect).to eq "(5)4)3)2)1)"
  end

  example 'after pushing 1 through 3, and then /abc/: (/abc/)3)2)1)' do
    (1..3).each { |i| stack.push i }
    stack.push(/abc/)
    expect(stack.inspect).to eq "(/abc/)3)2)1)"
  end

  example 'after pushing lotsa stuff: ([1, 2, 3])"abc")true)false)nil)' do
    [nil, false, true, "abc", [1,2,3]].each { |e| stack.push e }
    expect(stack.inspect).to eq '([1, 2, 3])"abc")true)false)nil)'
  end
end
