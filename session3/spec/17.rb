require File.join( File.dirname(__FILE__) , 'helper' )

describe 'print_list_in_reverse' do
  
  it 'should be defined' do
    method(:print_list_in_reverse).should be
  end


  list = nil

  1.upto 10 do |i|
    head      =  { :data => i, :next => list }
    list      =  head
    expected  =  (1..i).to_a.join("\n") + "\n"
    it "should print #{expected.inspect} for #{head.inspect}" do
      input_output{ print_list_in_reverse head }.should == expected
    end
  end

end
