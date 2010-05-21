require 'stringio'

def input_output(a,b)
  ARGV.clear                            # fucking most annoying bug ever, why the fuck does $stdin.gets give a shit about ARGV?
  stdout , stdin = $stdout , $stdin
  $stdin  = StringIO.new "#{a} #{b}"
  to_return = $stdout = StringIO.new
  sum_difference_product
  $stdout , $stdin = STDOUT , $stdin
  to_return.rewind
  to_return.read.split
end


describe '1 input and output' do
  [     9 ,     2 ,
        4 ,     9 ,
        8 ,     7 ,
        7 ,     6 ,
        1 ,    62 ,
       12 ,    86 ,
        1 ,    90 ,
       15 ,    99 ,
        1 ,    26 ,
       78 ,   235 ,
      537 ,   664 ,
      838 ,   836 ,
      431 ,   157 ,
      652 ,   501 ,
      149 ,  6483 ,
     7227 ,  1828 ,
     6289 ,  8799 ,
     6116 ,  5278 ,
     5050 ,  5496 ,
     4062 , 84148 ,
    65060 , 91283 ,
    77229 , 83467 ,
     2117 , 45519 ,
    79153 , 15579 ,
    65874 , 81096 ,
       -5 ,     5 ,
     -235 ,    98 ,
        0 ,     0 ,
        0 ,     5 ,
  ].each_slice 2 do |a,b|
    it "should output #{a+b} , #{a-b} , #{a*b} when given #{a} , #{b}" do
      input_output(a,b).should == [a+b , a-b , a*b].map { |n| n.to_s }
    end
  end
end