describe 'Person' do
  
  it 'should be a class called Person' do
    the_classes = Module.constants.map { |c| c.to_s }.grep('Person')
    the_classes.first.should == 'Person'
    the_classes.size.should == 1
    Person.class.should == Class
  end
  
  it 'should have a name getter' do
    jim = Person.new 'Jim' , 45
    jim.name.should == 'Jim'
  end
  
  it 'should have a name setter' do
    jim = Person.new 'Jim' , 45
    jim.name = 'Jimmy'
    jim.name.should == 'Jimmy'
  end
  
  it 'should have an age getter' do
    jim = Person.new 'Jim' , 45
    jim.age.should == 45
  end
  
  it 'should have an age setter' do
    jim = Person.new 'Jim' , 45
    jim.age = 30
    jim.age.should == 30
  end
  
  it 'should have a birthday method which ' do
    jim = Person.new 'Jim' , 45
    jim.birthday.should == 46
    jim.age.should == 46
  end
  
  it 'should be able to have many birthdays' do
    jim = Person.new 'Jim' , 45
    1.upto 10 do |i|
      jim.birthday.should == 45 + i
      jim.age.should == 45 + i
    end
  end
  
  it 'should understand the difference between two people' do
    jim = Person.new 'Jim' , 45
    jan = Person.new 'Jan' , 25
    1.upto 10 do |i|
      jim.birthday.should == 45 + i
      jim.age.should      == 45 + i
      jan.birthday.should == 25 + i
      jan.age.should      == 25 + i
    end
  end
  
end