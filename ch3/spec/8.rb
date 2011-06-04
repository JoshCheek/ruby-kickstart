describe 'Person:' do
  
  before :each do
    @artist = Person.new :name => 'Prince' do |person|
      person.age    =  47
      person.quote  =  "Why don't you purify yourself in the waters of Lake Minnetonka?"
    end
  end
  
  
  it 'should have the name Prince' do
    @artist.name.should == 'Prince'
  end
  
  it 'should have an age of 47' do
    @artist.age.should == 47
  end
  
  it 'should have a quote of person.quote  =  "Why don\'t you purify yourself in the waters of Lake Minnetonka?"' do
    @artist.quote.should == "Why don't you purify yourself in the waters of Lake Minnetonka?"
  end
  
  it 'should be able to change its name' do
    @artist.name = 'The Artist Formarly Known As Prince'
    @artist.name.should == "The Artist Formarly Known As Prince"
  end
  
  it 'should be able to change its age' do
    @artist.age  = 1999
    @artist.age.should == 1999
  end
  
  it 'should be able to change its quote' do
    @artist.quote = "new quote"
    @artist.quote.should == "new quote"
  end
  
  it 'should not be able to reinit its name if name was not in the init block' do
    @artist.name = 'The Artist Formarly Known As Prince'
    @artist.reinit
    @artist.name.should == 'The Artist Formarly Known As Prince'
  end

  it 'should be able to reinit its age' do
    @artist.age = 1999
    @artist.reinit
    @artist.age.should == 47
  end
  
  it 'should be able to reinit its quote' do
    @artist.quote = 'new quote'
    @artist.reinit
    @artist.quote.should == "Why don't you purify yourself in the waters of Lake Minnetonka?"
  end
  
end


describe "Person's hash params" do
  
  it 'should be able to set name' do
    Person.new(:name => 'Kris').name.should == 'Kris'
  end
  
  it 'should be able to set the age' do
    Person.new(:age => 27).age.should == 27
  end
  
  it 'should be able to set the quote' do
    Person.new(:quote => 'Text if you wanna talk to me.').quote.should == 'Text if you wanna talk to me.'
  end
  
end






















