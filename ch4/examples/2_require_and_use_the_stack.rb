require '1_stack'

stack = Stack.new 77,90,"jkl",[67,90],{0=>8,:acv=>98}
stack.push(5).push(6).push(9).push(10).push('abc')
stack.push 1 , 2 , 3 , 4 , 5
stack.each { |data| p data }


puts "\n" * 5 + "using pop"
stack = Stack.new *(1..10) # the splat will invoke the to_a method before lining up params and args
puts stack.pop until stack.empty?