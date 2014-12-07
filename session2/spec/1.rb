require_relative 'helper'

RSpec.describe 'sum_difference_product' do
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
  ].each_slice 2 do |a, b|
    specify %Q[prints out "#{a+b}\\n#{a-b}\\n#{a*b}\\n" when stdin is "#{a} #{b}\\n"] do
      printed = input_output("#{a} #{b}"){ sum_difference_product }
      expect(printed).to include (a+b).to_s
      expect(printed).to include (a-b).to_s
      expect(printed).to include (a*b).to_s
    end
  end
end
