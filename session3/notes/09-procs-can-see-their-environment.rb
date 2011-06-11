# Unlike methods, procs can see the environment they're defined in.
count = 0
incrementer = Proc.new { count += 1 }

count                         # => 0
incrementer.call
count                         # => 1
incrementer.call
count                         # => 2


# They keep the environment they were defined in
# even if they get passed into a new scope.
def invoke_10_times(proc)
  10.times { proc.call }
end

count                         # => 2
invoke_10_times incrementer
count                         # => 12
