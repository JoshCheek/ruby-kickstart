require 'stringio'

def input_output( mock_stdin_with_this_str = String.new )
# fucking most annoying bug ever, why the fuck does $stdin.gets give a shit about ARGV?
  ARGV.clear        
  stdout , stdin = $stdout , $stdin
  $stdin  = StringIO.new mock_stdin_with_this_str
  to_return = $stdout = StringIO.new
  yield
  $stdout , $stdin = stdout , stdin
  to_return.rewind
  to_return.read
end
