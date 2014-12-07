def array_init(size=5, &block)
  block ||= Proc.new { |i| (100 * i).to_s }
  Array.new(size, &block)
end
