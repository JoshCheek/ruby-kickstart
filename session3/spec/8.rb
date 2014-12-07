RSpec.describe 'Person (example: prince)' do
  before :each do
    @artist = Person.new :name => 'Prince' do |person|
      person.age    =  47
      person.quote  =  "Why don't you purify yourself in the waters of Lake Minnetonka?"
    end
  end

  it 'has the name Prince' do
    expect(@artist.name).to eq 'Prince'
  end

  it 'has the age 47' do
    expect(@artist.age).to eq 47
  end

  it 'has a quote' do
    expect(@artist.quote).to eq "Why don't you purify yourself in the waters of Lake Minnetonka?"
  end

  it 'can change its name' do
    @artist.name = 'The Artist Formarly Known As Prince'
    expect(@artist.name).to eq "The Artist Formarly Known As Prince"
  end

  it 'can change its age' do
    @artist.age  = 1999
    expect(@artist.age).to eq 1999
  end

  it 'can change its quote' do
    @artist.quote = "new quote"
    expect(@artist.quote).to eq "new quote"
  end

  it 'calls the init block to reinit itself' do
    @artist.age   = 1999
    @artist.name  = 'The Artist Formarly Known As Prince'
    @artist.quote = 'new quote'
    @artist.reinit
    expect(@artist.age  ).to eq 47
    expect(@artist.quote).to eq "Why don't you purify yourself in the waters of Lake Minnetonka?"
    expect(@artist.name ).to eq 'The Artist Formarly Known As Prince' # no reset b/c not in init block
  end
end


RSpec.describe "Person's hash params" do
  it 'can set its name' do
    name = Person.new(:name => 'Kris').name
    expect(name).to eq 'Kris'
  end

  it 'can set its age' do
    age = Person.new(:age => 27).age
    expect(age).to eq 27
  end

  it 'can set its quote' do
    quote = Person.new(:quote => 'Text if you wanna talk to me.').quote
    expect(quote).to eq 'Text if you wanna talk to me.'
  end
end
