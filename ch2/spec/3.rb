describe 'String#every_other_char' do
  
  specify 'String should have an instance method named every_other_char' do
    String.new.should respond_to 'every_other_char'
  end
  
  specify 'empty string should return empty string' do
    String.new.every_other_char.should == ''
  end
  
  specify { 'Four score and seven years ago...'.every_other_char.should == 'Fu cr n ee er g..' }
  
  %w(
    abcdefg aceg
    0101010 0000
    1010101 1111
    !@#$%^& !#%&
    1       1
    12      1
    123     13
    1234    13
    12345   135
    123456  135
    1234567 1357
    lksjdafoijdsfioewutwekgnsdsoihblskjdklsgjoiuewyghowbnwoeincwe lsdfidfowtegssibsjksjieyhwnoice
  ).each_slice 2 do |input, output|
    specify "#{input.inspect}.every_other_char should return #{output.inspect}" do
      input.every_other_char.should == output
    end
  end

  
end