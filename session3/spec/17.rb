require_relative 'helper'

RSpec.describe 'print_list_in_reverse' do
  it 'is a toplevel method' do
    method :print_list_in_reverse # will raise an error if it can't find the method
  end

  list = nil

  1.upto 10 do |i|
    head      =  { :data => i, :next => list }
    list      =  head
    expected  =  (1..i).to_a.join("\n") + "\n"
    it "prints #{expected.inspect} for #{head.inspect}" do
      printed = input_output { print_list_in_reverse head }
      expect(printed).to eq expected
    end
  end
end
