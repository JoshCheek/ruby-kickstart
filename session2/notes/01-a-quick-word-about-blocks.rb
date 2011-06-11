# We'll talk about blocks more later, but for now just know
# that you declare a parameter in pipes (this is just
# like a method declaring parameters)

def mah_method!(method_param)
end


# This is the syntax for single line blocks
# note that you need parens around that 1,
# we'll discuss why later
mah_method!(1) { |block_parameter| block_parameter * 2 }


# you also have multiline syntax
# here you don't need parens around the 1
mah_method! 1 do |param1, param2|
  param1 + param2
end

