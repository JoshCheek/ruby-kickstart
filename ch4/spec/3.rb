describe 'same_star_char' do
  
  it 'should return true for same_star_char("xy*yzz")' do
    same_star_char("xy*yzz").should be_true
  end
  
  it 'should return false for same_star_char("xy*zzz")' do
    same_star_char("xy*zzz").should be_false
  end
  
  it 'should return true for same_star_char("*xa*az")' do
    same_star_char("*xa*az").should be_true
  end
  
  it 'should return false for same_star_char("*xa*bz")' do
    same_star_char("*xa*bz").should be_false
  end
  
  it 'should return true for same_star_char("*xa*a*")' do
    same_star_char("*xa*a*").should be_true
  end
  
  it 'should return true for same_star_char("")' do
    same_star_char("").should be_true
  end
  
  it 'should return true for same_star_char("*xa*a*a")' do
    same_star_char("*xa*a*a").should be_true
  end
  
  it 'should return false for same_star_char("*xa*a*b")' do
    same_star_char("*xa*a*b").should be_false
  end
  
  it 'should return true for same_star_char("*12*2*2")' do
    same_star_char("*12*2*2").should be_true
  end
  
  it 'should return false for same_star_char("12*2*3*")' do
    same_star_char("12*2*3*").should be_false
  end
  
  it 'should return true for same_star_char("abcDEF")' do
    same_star_char("abcDEF").should be_true
  end
  
  it 'should return false for same_star_char("XY*YYYY*Z*")' do
    same_star_char("XY*YYYY*Z*").should be_false
  end
  
  it 'should return true for same_star_char("XY*YYYY*Y*")' do
    same_star_char("XY*YYYY*Y*").should be_true
  end
  
  it 'should return false for same_star_char("12*2*3*")' do
    same_star_char("12*2*3*").should be_false
  end
  
  it 'should return true for same_star_char("*")' do
    same_star_char("*").should be_true
  end
  
  it 'should return true for same_star_char("**")' do
    same_star_char("**").should be_true
  end

end
