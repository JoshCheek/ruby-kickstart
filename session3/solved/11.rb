def array_init(size = 5)
  if block_given?
    ary = Array.new(size) { |i| yield i }
  else
    ary = Array.new(size) { |i| (100 * i).to_s }
  end
end