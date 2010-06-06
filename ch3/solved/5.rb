def array_init( indexes = 5 )
  Array.new indexes do |index|
    if block_given?
      yield index
    else
      ( 100 * index ).to_s
    end
  end
end