RSpec.describe 'String#every_other_char' do
  specify '"" -> ""' do
    expect("".every_other_char).to eq ""
  end

  input  = 'Four score and seven years ago...'
  output = 'Fu cr n ee er g..'
  specify "#{input.inspect} -> #{output.inspect}" do
    expect(input.every_other_char).to eq output
  end

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
    specify "#{input.inspect} -> #{output.inspect}" do
      expect(input.every_other_char).to eq output
    end
  end
end
