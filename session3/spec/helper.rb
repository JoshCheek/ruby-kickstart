require 'stringio'

RSpec.configure do |config|
  config.disable_monkey_patching!

  test_helpers = Module.new do
    def input_output(mock_stdin_with_this_str=String.new)
      ARGV.clear # -.0
      stdout , stdin = $stdout , $stdin
      $stdin  = StringIO.new mock_stdin_with_this_str
      to_return = $stdout = StringIO.new
      yield
      $stdout , $stdin = stdout , stdin
      to_return.rewind
      to_return.read
    end
  end

  config.include test_helpers
end
