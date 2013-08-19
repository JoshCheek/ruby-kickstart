=begin rdoc

===
 text = <<eot

 Given a string, replace every instance of sad with happy.

 The examples run:
  add_more_ruby( "The clowns were sad." )           # => "The clowns were happy."
  add_more_ruby( "The sad dad said sad stuff." )    # => "The happy dad said happy stuff."
  add_more_ruby( "Sad times are ahead!" )           # => "Happy times are ahead!"

  def add_more_ruby( string )
    Your code here
  end

 eot

 describe text do
  
  it 'should change sad to happy' do
    add_more_ruby( "The clowns were sad." ).should == "The clowns were happy."
  end
  
  it 'should change sad at the end' do
    add_more_ruby( "abc sad" ).should == "abc happy"
  end
  
  it 'should change sad every time it sees it' do
    add_more_ruby( "The sad dad said sad stuff." ).should == "The happy dad said happy stuff."
  end
  
  it 'should make Happy uppercase if Sad is uppercase' do
    add_more_ruby( "Sad times are ahead!" ).should == "Happy times are ahead!"
  end
  
  it 'should change lots of sads in a row' do
    add_more_ruby( "sadSadsadsad" ).should == "happyHappyhappyhappy"
  end
  
 end

=end

text = <<eot

 Given a string, replace every instance of sad with happy.

 The examples run:
  add_more_ruby( "The clowns were sad." )           # => "The clowns were happy."
  add_more_ruby( "The sad dad said sad stuff." )    # => "The happy dad said happy stuff."
  add_more_ruby( "Sad times are ahead!" )           # => "Happy times are ahead!"

  def add_more_ruby( string )
    Your code here
  end

eot

describe text do
  
  it 'should change sad to happy' do
    add_more_ruby( "The clowns were sad." ).should == "The clowns were happy."
  end
  
  it 'should change sad at the end' do
    add_more_ruby( "abc sad" ).should == "abc happy"
  end
  
  it 'should change sad every time it sees it' do
    add_more_ruby( "The sad dad said sad stuff." ).should == "The happy dad said happy stuff."
  end
  
  it 'should make Happy uppercase if Sad is uppercase' do
    add_more_ruby( "Sad times are ahead!" ).should == "Happy times are ahead!"
  end
  
  it 'should change lots of sads in a row' do
    add_more_ruby( "sadSadsadsad" ).should == "happyHappyhappyhappy"
  end
  
end