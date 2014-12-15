RSpec.describe 'context' do
  specify '1_stack_classes_inspect has been required' do
    path = File.expand_path("../../challenge/1_stack_classes_inspect.rb", __FILE__)
    expanded_loaded_features = $LOADED_FEATURES.map { |filename| File.expand_path filename }
    expect(expanded_loaded_features).to include path
  end
end

RSpec.describe 'StackInDisguise' do
  specify 'it is a subclass of Stack' do
    expect(StackInDisguise.superclass).to eq Stack
  end

  describe '#inspect' do
    let(:stack) { StackInDisguise.new }

    it 'overrides inspect' do
      expect(stack.method(:inspect).owner).to eq StackInDisguise
    end

    it 'inspects with square brackets []' do
      expect(stack.inspect).to eq "[]"
    end

    it 'after pushing 1: [1]' do
      stack.push 1
      expect(stack.inspect).to eq '[1]'
    end

    it 'after pushing a hash: [{1=>2}]' do
      stack.push({1=>2})
      expect(stack.inspect).to eq '[{1=>2}]'
    end

    it 'after pushing 1, then 2, then 3: [1, 2, 3]' do
      (1..3).each { |i| stack.push i }
      expect(stack.inspect).to eq '[1, 2, 3]'
    end

    it 'after pushing 1 through 5: [1, 2, 3, 4, 5]' do
      (1..5).each { |i| stack.push i }
      expect(stack.inspect).to eq '[1, 2, 3, 4, 5]'
    end

    it 'after pushing 1 through 3, and then /abc/: [1, 2, 3, /abc/]' do
      (1..3).each { |i| stack.push i }
      stack.push(/abc/)
      expect(stack.inspect).to eq '[1, 2, 3, /abc/]'
    end

    it 'after pushing lotsa stuff [nil, false, true, "abc", [1, 2, 3]]' do
      [nil, false, true, "abc", [1,2,3]].each { |e| stack.push e }
      expect(stack.inspect).to eq '[nil, false, true, "abc", [1, 2, 3]]'
    end
  end
end
