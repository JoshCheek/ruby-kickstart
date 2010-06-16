describe "equal_is_not?" do
  it 'should return false when given equal_is_not?("This is not")' do
    equal_is_not?("This is not").should be_false
  end
  
  it 'should return true when given equal_is_not?("This is notnot")' do
    equal_is_not?("This is notnot").should be_true
  end
  
  it 'should return true when given equal_is_not?("noisxxnotyynotxisi")' do
    equal_is_not?("noisxxnotyynotxisi").should be_true
  end
  
  it 'should return false when given equal_is_not?("noisxxnotyynotxsi")' do
    equal_is_not?("noisxxnotyynotxsi").should be_false
  end
  
  it 'should return true when given equal_is_not?("xxxyyyzzzintint")' do
    equal_is_not?("xxxyyyzzzintint").should be_true
  end
  
  it 'should return true when given equal_is_not?("")' do
    equal_is_not?("").should be_true
  end
  
  it 'should return true when given equal_is_not?("isisnotnot")' do
    equal_is_not?("isisnotnot").should be_true
  end
  
  it 'should return false when given equal_is_not?("isisnotno7Not")' do
    equal_is_not?("isisnotno7Not").should be_false
  end
  
  it 'should return false when given equal_is_not?("isnotis")' do
    equal_is_not?("isnotis").should be_false
  end
  
  it 'should return false when given equal_is_not?("mis3notpotbotis")' do
    equal_is_not?("mis3notpotbotis").should be_false
  end
  
  it 'should return false when given equal_is_not?("not")' do
    equal_is_not?("not").should be_false
  end
  
  it 'should return false when given equal_is_not?("is")' do
    equal_is_not?("is").should be_false
  end
  
  it 'should return true when given equal_is_not?("notis")' do
    equal_is_not?("notis").should be_true
  end
  
  it 'should return true when given equal_is_not?("isnot")' do
    equal_is_not?("isnot").should be_true
  end
  
  it 'should return false when given equal_is_not?("isisnot")' do
    equal_is_not?("isisnot").should be_false
  end
  
  it 'should return false when given equal_is_not?("notnotis")' do
    equal_is_not?("notnotis").should be_false
  end
  
  it 'should return true when given equal_is_not?("nitos")' do
    equal_is_not?("nitos").should be_true
  end
  
  it 'should return false when given equal_is_not?("inots")' do
    equal_is_not?("inots").should be_false
  end
  
  it 'should return false when given equal_is_not?("nisot")' do
    equal_is_not?("nisot").should be_false
  end
  
  it 'should return false when given equal_is_not?("is is is isisis isnotnot is not not is not")' do
    equal_is_not?("is is is isisis isnotnot is not not is not").should be_false
  end
  
  it 'should return true when given equal_is_not?("is is is isisis isnotnot is not not is not notnotnotnot")' do
    equal_is_not?("is is is isisis isnotnot is not not is not notnotnotnot").should be_true
  end
  
  it 'should return false when given equal_is_not?("is is is isisis isnotnot is not not is not no tnotnotnot")' do
    equal_is_not?("is is is isisis isnotnot is not not is not no tnotnotnot").should be_false
  end
  
  it 'should return true when given equal_is_not?("fish note")' do
    equal_is_not?("fish note").should be_true
  end
  
  it 'should return true when given equal_is_not?("swishing this, not snot")' do
    equal_is_not?("swishing this, not snot").should be_true
  end
  
end