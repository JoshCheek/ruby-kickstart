class Student
  include OperatorGeneratorFromSpace

  GRADES = [:freshman, :sophmore, :junior, :senior]

  attr_accessor :age , :grade

  def initialize(age, grade)
    @age, @grade = age, grade
  end

  def <=>(student)
    return age <=> student.age unless age == student.age
    GRADES.index(grade) <=> GRADES.index(student.grade)
  end
end


RSpec.describe OperatorGeneratorFromSpace do
  def assert(left, comparer, right)
    expect(left).to be.send(comparer, right)
  end

  def refute(left, comparer, right)
    expect(left).to_not be.send(comparer, right)
  end

  example 'returns true  for Student.new(20,:freshman) == Student.new(20,:freshman)' do
    assert Student.new(20, :freshman), :==, Student.new(20, :freshman)
  end

  example 'returns false for Student.new(20,:freshman) <  Student.new(20,:freshman)' do
    refute Student.new(20,:freshman), :<,  Student.new(20,:freshman)
  end

  example 'returns false for Student.new(20,:freshman) >  Student.new(20,:freshman)' do
    refute Student.new(20,:freshman), :>,  Student.new(20,:freshman)
  end

  example 'returns true  for Student.new(20,:freshman) >= Student.new(20,:freshman)' do
    assert Student.new(20,:freshman), :>=, Student.new(20,:freshman)
  end

  example 'returns true  for Student.new(20,:freshman) <= Student.new(20,:freshman)' do
    assert Student.new(20,:freshman), :<=, Student.new(20,:freshman)
  end


  example 'returns false for Student.new(20,:freshman) == Student.new(20,:sophmore)' do
    refute Student.new(20,:freshman), :==, Student.new(20,:sophmore)
  end

  example 'returns true  for Student.new(20,:freshman) <  Student.new(20,:sophmore)' do
    assert Student.new(20,:freshman), :<,  Student.new(20,:sophmore)
  end

  example 'returns false for Student.new(20,:freshman) >  Student.new(20,:sophmore)' do
    refute Student.new(20,:freshman), :>, Student.new(20,:sophmore)
  end

  example 'returns true  for Student.new(20,:freshman) <= Student.new(20,:sophmore)' do
    assert Student.new(20,:freshman), :<=, Student.new(20,:sophmore)
  end

  example 'returns false for Student.new(20,:freshman) >= Student.new(20,:sophmore)' do
    refute Student.new(20,:freshman), :>=, Student.new(20,:sophmore)
  end


  example 'returns false for Student.new(20,:sophmore) == Student.new(20,:freshman)' do
    refute Student.new(20,:sophmore), :==, Student.new(20,:freshman)
  end

  example 'returns false for Student.new(20,:sophmore) <  Student.new(20,:freshman)' do
    refute Student.new(20,:sophmore), :<, Student.new(20,:freshman)
  end

  example 'returns true  for Student.new(20,:sophmore) >  Student.new(20,:freshman)' do
    assert Student.new(20,:sophmore), :>, Student.new(20,:freshman)
  end

  example 'returns false for Student.new(20,:sophmore) <= Student.new(20,:freshman)' do
    refute Student.new(20,:sophmore), :<=, Student.new(20,:freshman)
  end

  example 'returns true  for Student.new(20,:sophmore) >= Student.new(20,:freshman)' do
    assert Student.new(20,:sophmore), :>=, Student.new(20,:freshman)
  end


  example 'returns false for Student.new(20,:sophmore) == Student.new(30,:freshman)' do
    refute Student.new(20,:sophmore), :==, Student.new(30,:freshman)
  end

  example 'returns true  for Student.new(20,:sophmore) <  Student.new(30,:freshman)' do
    assert Student.new(20,:sophmore), :<, Student.new(30,:freshman)
  end

  example 'returns false for Student.new(20,:sophmore) >  Student.new(30,:freshman)' do
    refute Student.new(20,:sophmore), :>, Student.new(30,:freshman)
  end

  example 'returns true  for Student.new(20,:sophmore) <= Student.new(30,:freshman)' do
    assert Student.new(20,:sophmore), :<=, Student.new(30,:freshman)
  end

  example 'returns false for Student.new(20,:sophmore) >= Student.new(30,:freshman)' do
    refute Student.new(20,:sophmore), :>=, Student.new(30,:freshman)
  end


  example 'returns false for Student.new(30,:sophmore) == Student.new(20,:freshman)' do
    refute Student.new(30,:sophmore), :==, Student.new(20,:freshman)
  end

  example 'returns false for Student.new(30,:sophmore) <  Student.new(20,:freshman)' do
    refute Student.new(30,:sophmore), :<, Student.new(20,:freshman)
  end

  example 'returns true  for Student.new(30,:sophmore) >  Student.new(20,:freshman)' do
    assert Student.new(30,:sophmore), :>, Student.new(20,:freshman)
  end

  example 'returns false for Student.new(30,:sophmore) <= Student.new(20,:freshman)' do
    refute Student.new(30,:sophmore), :<=, Student.new(20,:freshman)
  end

  example 'returns true  for Student.new(30,:sophmore) >= Student.new(20,:freshman)' do
    assert Student.new(30,:sophmore), :>=, Student.new(20,:freshman)
  end


  example 'returns false for Student.new(20,:sophmore) == Student.new(30,:freshman)' do
    refute Student.new(20,:sophmore), :==, Student.new(30,:freshman)
  end

  example 'returns true  for Student.new(20,:sophmore) <  Student.new(30,:freshman)' do
    assert Student.new(20,:sophmore), :<, Student.new(30,:freshman)
  end

  example 'returns false for Student.new(20,:sophmore) >  Student.new(30,:freshman)' do
    refute Student.new(20,:sophmore), :>, Student.new(30,:freshman)
  end

  example 'returns true  for Student.new(20,:sophmore) <= Student.new(30,:freshman)' do
    assert Student.new(20,:sophmore), :<=, Student.new(30,:freshman)
  end

  example 'returns false for Student.new(20,:sophmore) >= Student.new(30,:freshman)' do
    refute Student.new(20,:sophmore), :>=, Student.new(30,:freshman)
  end

  example 'can sort a bunch of students' do
    unsorted = [
      Student.new(20, :freshman) ,
      Student.new(30, :freshman) ,
      Student.new(40, :freshman) ,
      Student.new(50, :freshman) ,

      Student.new(20, :sophmore) ,
      Student.new(30, :sophmore) ,
      Student.new(40, :sophmore) ,
      Student.new(50, :sophmore) ,

      Student.new(20, :junior) ,
      Student.new(30, :junior) ,
      Student.new(40, :junior) ,
      Student.new(50, :junior) ,

      Student.new(20, :senior) ,
      Student.new(30, :senior) ,
      Student.new(40, :senior) ,
      Student.new(50, :senior) ,
    ]
    sorted = [
      Student.new(20, :freshman),
      Student.new(20, :sophmore),
      Student.new(20, :junior),
      Student.new(20, :senior),

      Student.new(30, :freshman),
      Student.new(30, :sophmore),
      Student.new(30, :junior),
      Student.new(30, :senior),

      Student.new(40, :freshman),
      Student.new(40, :sophmore),
      Student.new(40, :junior),
      Student.new(40, :senior),

      Student.new(50, :freshman),
      Student.new(50, :sophmore),
      Student.new(50, :junior),
      Student.new(50, :senior),
    ]
    expect(unsorted.sort).to eq sorted
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

    example '2 < 0   # => false' do
      refute @o.new(2), :<, @o.new(0)
    end

    example '4 > 2   # => true' do
      assert @o.new(4), :>, @o.new(2)
    end

    example '3 <= 6  # => false' do
      assert @o.new(3), :<, @o.new(6)
    end

    example '7 >= 7  # => true' do
      assert @o.new(7), :>=, @o.new(7)
    end

    example '8 < 4   # => false' do
      refute @o.new(8), :<, @o.new(4)
    end

    example '0 == 7  # => false' do
      refute @o.new(0), :==, @o.new(7)
    end
  end
end
