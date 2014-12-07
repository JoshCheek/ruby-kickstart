require_relative 'helper'

# This challenge is an extension of example 2, so we've included its source as a starting point
#
# Prompt the user for a number, then read it in and print out "hi" that many times
#
# Repeat this process until the user submits "bye", then say "goodbye" and end the program
#
#         example:
#
#         PROGRAM: Enter a number or bye
#         USER:    4
#         PROGRAM: hi hi hi hi
#         PROGRAM: Enter a number or bye
#         USER:    2
#         PROGRAM: hi hi
#         PROGRAM: Enter a number or bye
#         USER:    bye
#         PROGRAM: goodbye


# remember you can try your program out with              $ ruby 2_input_output_control.rb
# and when you think it is correct, you can test it with  $ rake 2:2


RSpec.describe 'hi_hi_goodbye' do
  def self.sum(ary)
    ary.inject(0) { |sum,n| sum + n }
  end

  def hi_hi_goodbye_tester(inputs=Array.new)
    output = input_output("#{inputs.join "\n"}\nbye\n") { hi_hi_goodbye }
    expect(output.scan(/\bhi\b/mi).length).to eq self.class.sum(inputs)
    expect(output).to match /goodbye.*\Z/i
  end

  it 'does not print "hi" when the first submission is "bye"' do
    hi_hi_goodbye_tester
  end

  it 'says "hi" 6 times and "goodbye" once when given "4,2,bye"' do
    hi_hi_goodbye_tester [4, 2]
  end

  [ [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [2, 2, 0, 4, 1, 4, 2, 6, 6, 3, 0, 3, 1, 3, 6],
    [26, 2, 8, 25, 1, 19, 8, 0, 17, 24, 16, 2, 24, 1, 19],
    [13, 59, 59, 28, 11, 34, 58, 49, 32],
    [37, 112, 98, 97, 56, 119, 5, 93, 75, 17, 55, 95, 13, 113, 86, 93, 22],
    [48, 125, 31, 32, 7, 199, 215, 102, 204, 58, 14, 195, 69, 124, 66],
    [265, 278, 247, 64, 284, 133, 128, 232, 301],
    [18, 258, 195, 455, 368, 391, 0],
    [74, 505, 59, 38, 690, 720, 271, 376, 533, 499],
    [795, 71, 926, 282, 362, 352, 924, 942, 422, 607, 312, 521, 161, 913, 416, 426, 110, 407, 404],
    [1312, 1053, 928, 83, 541, 929, 256, 226, 795, 500, 385, 322, 351, 861, 104, 28],
    [710, 963, 964, 1134, 1147, 619, 126, 652, 15, 928, 417, 351, 857, 796, 94, 1497, 1500, 1277, 1445, 1391],
    [1010, 1048, 1328, 547, 810, 1368, 660, 1338, 2029, 32, 1705],
    [906, 2353, 2549, 2728, 113, 2326, 2352, 2566, 2594, 1, 287, 2736, 841, 2438],
    [1366, 11, 2246, 1581, 1936, 1231, 1936, 981, 1002, 2683, 561, 1991, 708, 1873, 2370, 431],
  ].each do |inputs|
    it "says \"hi\" #{sum inputs} times and \"goodbye\" once when given #{inputs.inspect}" do
      hi_hi_goodbye_tester inputs
    end
  end
end
