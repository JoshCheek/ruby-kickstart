class Student
  
  include OperatorGeneratorFromSpace
  
  GRADES = [ :freshman , :sophmore , :junior , :senior ]
  
  attr_accessor :age , :grade
  
  def initialize( age , grade )
    @age , @grade = age , grade
  end
  
  def <=>(student)
    if age == student.age
      GRADES.index(grade) <=> GRADES.index(student.grade)
    else
      age <=> student.age
    end
  end
  
end

describe OperatorGeneratorFromSpace do
  it 'should return true for Student.new(20,:freshman) == Student.new(20,:freshman)' do
    (Student.new(20,:freshman) == Student.new(20,:freshman)).should be_true
  end
  
  it 'should return false for Student.new(20,:freshman) <  Student.new(20,:freshman)' do
    (Student.new(20,:freshman) <  Student.new(20,:freshman)).should be_false
  end
  
  it 'should return false for Student.new(20,:freshman) >  Student.new(20,:freshman)' do
    (Student.new(20,:freshman) >  Student.new(20,:freshman)).should be_false
  end
  
  it 'should return true for Student.new(20,:freshman) >= Student.new(20,:freshman)' do
    (Student.new(20,:freshman) >= Student.new(20,:freshman)).should be_true
  end
  
  it 'should return true for Student.new(20,:freshman) <= Student.new(20,:freshman)' do
    (Student.new(20,:freshman) <= Student.new(20,:freshman)).should be_true
  end
  

  it 'should return false for Student.new(20,:freshman) == Student.new(20,:sophmore)' do
    (Student.new(20,:freshman) == Student.new(20,:sophmore)).should be_false
  end
  
  it 'should return true for Student.new(20,:freshman) <  Student.new(20,:sophmore)' do
    (Student.new(20,:freshman) <  Student.new(20,:sophmore)).should be_true
  end
  
  it 'should return false for Student.new(20,:freshman) >  Student.new(20,:sophmore)' do
    (Student.new(20,:freshman) >  Student.new(20,:sophmore)).should be_false
  end
  
  it 'should return true for Student.new(20,:freshman) <= Student.new(20,:sophmore)' do
    (Student.new(20,:freshman) <= Student.new(20,:sophmore)).should be_true
  end
  
  it 'should return false for Student.new(20,:freshman) >= Student.new(20,:sophmore)' do
    (Student.new(20,:freshman) >= Student.new(20,:sophmore)).should be_false
  end
  

  it 'should return false for Student.new(20,:sophmore) == Student.new(20,:freshman)' do
    (Student.new(20,:sophmore) == Student.new(20,:freshman)).should be_false
  end
  
  it 'should return false for Student.new(20,:sophmore) <  Student.new(20,:freshman)' do
    (Student.new(20,:sophmore) <  Student.new(20,:freshman)).should be_false
  end
  
  it 'should return true for Student.new(20,:sophmore) >  Student.new(20,:freshman)' do
    (Student.new(20,:sophmore) >  Student.new(20,:freshman)).should be_true
  end
  
  it 'should return false for Student.new(20,:sophmore) <= Student.new(20,:freshman)' do
    (Student.new(20,:sophmore) <= Student.new(20,:freshman)).should be_false
  end
  
  it 'should return true for Student.new(20,:sophmore) >= Student.new(20,:freshman)' do
    (Student.new(20,:sophmore) >= Student.new(20,:freshman)).should be_true
  end
  

  it 'should return false for Student.new(20,:sophmore) == Student.new(30,:freshman)' do
    (Student.new(20,:sophmore) == Student.new(30,:freshman)).should be_false
  end
  
  it 'should return true for Student.new(20,:sophmore) <  Student.new(30,:freshman)' do
    (Student.new(20,:sophmore) <  Student.new(30,:freshman)).should be_true
  end
  
  it 'should return false for Student.new(20,:sophmore) >  Student.new(30,:freshman)' do
    (Student.new(20,:sophmore) >  Student.new(30,:freshman)).should be_false
  end
  
  it 'should return true for Student.new(20,:sophmore) <= Student.new(30,:freshman)' do
    (Student.new(20,:sophmore) <= Student.new(30,:freshman)).should be_true
  end
  
  it 'should return false for Student.new(20,:sophmore) >= Student.new(30,:freshman)' do
    (Student.new(20,:sophmore) >= Student.new(30,:freshman)).should be_false
  end
  

  it 'should return false for Student.new(30,:sophmore) == Student.new(20,:freshman)' do
    (Student.new(30,:sophmore) == Student.new(20,:freshman)).should be_false
  end
  
  it 'should return false for Student.new(30,:sophmore) <  Student.new(20,:freshman)' do
    (Student.new(30,:sophmore) <  Student.new(20,:freshman)).should be_false
  end
  
  it 'should return true for Student.new(30,:sophmore) >  Student.new(20,:freshman)' do
    (Student.new(30,:sophmore) >  Student.new(20,:freshman)).should be_true
  end
  
  it 'should return false for Student.new(30,:sophmore) <= Student.new(20,:freshman)' do
    (Student.new(30,:sophmore) <= Student.new(20,:freshman)).should be_false
  end
  
  it 'should return true for Student.new(30,:sophmore) >= Student.new(20,:freshman)' do
    (Student.new(30,:sophmore) >= Student.new(20,:freshman)).should be_true
  end
  

  it 'should return false for Student.new(20,:sophmore) == Student.new(30,:freshman)' do
    (Student.new(20,:sophmore) == Student.new(30,:freshman)).should be_false
  end
  
  it 'should return true for Student.new(20,:sophmore) <  Student.new(30,:freshman)' do
    (Student.new(20,:sophmore) <  Student.new(30,:freshman)).should be_true
  end
  
  it 'should return false for Student.new(20,:sophmore) >  Student.new(30,:freshman)' do
    (Student.new(20,:sophmore) >  Student.new(30,:freshman)).should be_false
  end
  
  it 'should return true for Student.new(20,:sophmore) <= Student.new(30,:freshman)' do
    (Student.new(20,:sophmore) <= Student.new(30,:freshman)).should be_true
  end
  
  it 'should return false for Student.new(20,:sophmore) >= Student.new(30,:freshman)' do
    (Student.new(20,:sophmore) >= Student.new(30,:freshman)).should be_false
  end
  
  it 'should be able to sort a bunch of students' do
    [
      Student.new( 20 , :freshman ) ,
      Student.new( 30 , :freshman ) ,
      Student.new( 40 , :freshman ) ,
      Student.new( 50 , :freshman ) ,

      Student.new( 20 , :sophmore ) ,
      Student.new( 30 , :sophmore ) ,
      Student.new( 40 , :sophmore ) ,
      Student.new( 50 , :sophmore ) ,

      Student.new( 20 , :junior   ) ,
      Student.new( 30 , :junior   ) ,
      Student.new( 40 , :junior   ) ,
      Student.new( 50 , :junior   ) ,

      Student.new( 20 , :senior   ) ,
      Student.new( 30 , :senior   ) ,
      Student.new( 40 , :senior   ) ,
      Student.new( 50 , :senior   ) ,
    ].sort.should == [
      Student.new( 20 , :freshman ), 
      Student.new( 20 , :sophmore ), 
      Student.new( 20 , :junior ), 
      Student.new( 20 , :senior ), 

      Student.new( 30 , :freshman ), 
      Student.new( 30 , :sophmore ), 
      Student.new( 30 , :junior ), 
      Student.new( 30 , :senior ), 

      Student.new( 40 , :freshman ), 
      Student.new( 40 , :sophmore ), 
      Student.new( 40 , :junior ), 
      Student.new( 40 , :senior ), 

      Student.new( 50 , :freshman ), 
      Student.new( 50 , :sophmore ), 
      Student.new( 50 , :junior ), 
      Student.new( 50 , :senior ), 
    ]
  end






  describe 'when applied to anonymous class' do
  
    before :each do
      @o = Class.new do
        include OperatorGeneratorFromSpace
        attr_accessor :n
        def initialize(n)   @n = n      end
        def <=>(x)          n <=> x.n   end
      end      
    end
  
    it '2 < 0  # => false' do
      (@o.new(2) < @o.new(0)).should be_false
    end

    it '4 > 2  # => true' do    
      (@o.new(4) > @o.new(2)).should be_true
    end
    
    it '3 <= 6  # => false' do
      (@o.new(3) < @o.new(6)).should be_true
    end

    it '7 >= 7  # => true' do    
      (@o.new(7) >= @o.new(7)).should be_true
    end

    it '8 < 4  # => false' do    
      (@o.new(8) < @o.new(4)).should be_false
    end

    it '0 == 7  # => false' do    
      (@o.new(0) == @o.new(7)).should be_false
    end
  end  
  
end

