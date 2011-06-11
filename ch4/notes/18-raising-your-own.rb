# You can raise an existing exception by passing it to raise
begin
  raise Exception.new("We made this!")
rescue Exception => e
  e # => #<Exception: We made this!>
end


# If you pass a string to raise, it will be a RuntimeError
begin
  raise "Fix your shit"
rescue RuntimeError => e
  e # => #<RuntimeError: Fix your shit>
end
