describe 'pirates_say_arrrrrrrrr' do
  
  it 'should return "eeu" when given "are you really learning Ruby?"' do
    pirates_say_arrrrrrrrr("are you really learning Ruby?").should == "eenu"
  end
  
  it 'should return "rya" when given "Katy Perry is on the radio!"' do
    pirates_say_arrrrrrrrr("Katy Perry is on the radio!").should == "rya"
  end
  
  it 'should return "arrrrrrrr" when given "Pirates say arrrrrrrrr"' do
    pirates_say_arrrrrrrrr("Pirates say arrrrrrrrr").should == "arrrrrrrr"
  end
  
  it 'should return "12" when given "r1r2r"' do
    pirates_say_arrrrrrrrr("r1r2r").should == '12'
  end
  
  it 'should return "" when given ""' do
    pirates_say_arrrrrrrrr("").should == ""
  end
  
  it 'should return "" when given "Quickly she consumed the apple."' do
    pirates_say_arrrrrrrrr("Quickly she consumed the apple.").should == ''
  end
  
end
