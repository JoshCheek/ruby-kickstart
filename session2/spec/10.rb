RSpec.describe 'Person' do
  let(:jim) { Person.new 'Jim' , 45 }

  it 'has a name getter' do
    expect(jim.name).to eq 'Jim'
  end

  it 'has a name setter' do
    expect(jim.name).to_not eq 'Jimmy'
    jim.name = 'Jimmy'
    expect(jim.name).to eq 'Jimmy'
  end

  it 'has an age getter' do
    expect(jim.age).to eq 45
  end

  it 'has an age setter' do
    expect(jim.age).to_not eq 30
    jim.age = 30
    expect(jim.age).to eq 30
  end

  it 'has a birthday method which increases the age' do
    expect(jim.age).to eq 45
    expect(jim.birthday).to eq 46
    expect(jim.age).to eq 46
  end

  it 'can have multiple birthdays' do
    1.upto 10 do |i|
      expect(jim.birthday).to eq 45 + i
      expect(jim.age).to eq 45 + i
    end
  end

  it 'understands the difference between two people' do
    jim = Person.new 'Jim' , 45
    jan = Person.new 'Jan' , 25
    1.upto 10 do |i|
      expect(jim.birthday).to eq 45 + i
      expect(jim.age     ).to eq 45 + i
      expect(jan.birthday).to eq 25 + i
      expect(jan.age     ).to eq 25 + i
    end
  end
end
