# Did you understand the last one?
# This is the same one, but we abstracted the tasks
# into methods that are easier to test,
# and can be reused easily. They also let us talk
# about a task based on the method name, which is
# much simpler than the piece of code behind it.


def get_line
  gets.chomp
end

def finished?(line)
  line == "exit"
end

def user_message(lines_seen, line)
  if lines_seen.include? line
    "Yes, I've seen #{line} before"
  else
    "No, I haven't seen #{line} before"
  end
end

def record_observation(lines_seen, line)
  unless lines_seen.include? line
    lines_seen << line
  end
end


lines_seen = []

loop do
  line = get_line
  break if finished?(line)
  puts user_message(lines_seen, line)
  record_observation(lines_seen, line)
end

