describe 'alt_pairs' do
  
  it 'should return "kien" when given "kitten"' do
    alt_pairs("kitten").should == "kien"
  end
  
  it 'should return "Chole" when given "Chocolate"' do
    alt_pairs("Chocolate").should == "Chole"
  end
  
  it 'should return "Congrr" when given "CodingHorror"' do
    alt_pairs("CodingHorror").should == "Congrr"
  end

  it 'should return "ya" when given "yak"' do
    alt_pairs("yak").should == "ya"
  end
  
  it 'should return "y" when given "y"' do
    alt_pairs("y").should == "y"
  end
  
  it 'should return "" when given ""' do
    alt_pairs("").should == ""
  end

  it 'should return "ThThThth" when given "ThisThatTheOther"' do
    alt_pairs("ThisThatTheOther").should == "ThThThth"
  end

end