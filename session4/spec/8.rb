RSpec.describe 'exception_raiser' do
  it 'when given 1, it raises #<RuntimeError: No 1s allowed!>' do
    expect { exception_raiser 1 }.to raise_error(RuntimeError, "No 1s allowed!")
  end

  it 'when given 2, it raises #<ArgumentError: No 2s allowed!>' do
    expect { exception_raiser 2 }.to raise_error(ArgumentError, "No 2s allowed!")
  end

  it 'when given 3, it raises #<Exception: No 3s allowed!>' do
    expect { exception_raiser 3 }.to raise_error(Exception, "No 3s allowed!")
  end

  it 'when given 4, it raises #<SyntaxError: No 4s allowed!>' do
    expect { exception_raiser 4 }.to raise_error(SyntaxError, "No 4s allowed!")
  end

  it 'when given 5, it raises #<RubyKickstartException: No 5s allowed!>' do
    expect { exception_raiser 5 }.to raise_error(RubyKickstartException, "No 5s allowed!")
  end

  [-1, 0, "abc", /abc/].each do |object|
    it "doesn't raise an error when it receives #{object.inspect}" do
      expect { exception_raiser object }.to_not raise_error
    end
  end
end
