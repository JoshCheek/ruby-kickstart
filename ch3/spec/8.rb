describe 'your_sort' do
  
  it 'should return an empty array when receiving an empty array' do
    your_sort(Array.new).should == Array.new
  end
  
  it 'should return an unaltered array when it has 1 element' do
    your_sort([1]) { |a,b| a <=> b }.should == [1]
  end
  
  it 'should default to <=> when no block submitted' do
    your_sort([24, 0, 68, 44, 68, 47, 42, 66, 89, 22]).should == [0, 22, 24, 42, 44, 47, 66, 68, 68, 89]
  end
  
  it 'should be able to sort numbers normally' do
    result = your_sort [24, 0, 68, 44, 68, 47, 42, 66, 89, 22] do |a,b|
      if a < b
        -1
      elsif a > b
        1
      else
        0
      end
    end
    result.should == [0, 22, 24, 42, 44, 47, 66, 68, 68, 89]
  end
  
  it 'should be able to sort words by their second character' do
    result = your_sort %w(The quick brown fox jumps over the lazy dog) do |a,b|
      a[1] <=> b[1]
    end
    result.each_cons 2 do |a,b| 
      a[1].should <= b[1]
    end
  end
  
  it 'should be able to sort by strings, then integers, then floats, with each set sorted within itself' do
    result = your_sort [ 2.5 , 'r' , 1 , 4 , 'a' , 9 , 3 , 9.0 , 'm' , 25.8 ] do |a,b|
      a_class_val = [ String , Fixnum , Float ].index a.class
      b_class_val = [ String , Fixnum , Float ].index b.class
      if a_class_val == b_class_val
        a <=> b
      else
        a_class_val <=> b_class_val
      end
    end
    result.should == ["a", "m", "r", 1, 3, 4, 9, 2.5, 9.0, 25.8]  
  end

  it 'should be able to take this ordering I used in our Rakefile to get it to display the tasks such that:'              \
     'chapter:problem tasks always go first. Non chapter:problem tasks are sorted in dictionary order by the taskname.'   \
     'If it is a chapter:problem task, the earliest chapter goes first (sorted in numerical order).'                      \
     'If they are the same chapter, the earliest problem goes first (sorted in numerical order).'                         \
     'the task to run all problems goes last.'                                                                            do
       
    class Task
      attr_accessor :name , :description
      def initialize( name , description )
        @name , @description = name , description
      end
      def ==(other)
        description == other.description && name == other.name
      end
      def inspect
        "#<Task #{name}>"
      end
    end
    
    unsorted_tasklist = [  
      Task.new( '3:6'     , '# Test chapter3 problem6'      ),
      Task.new( '2:5'     , '# Test chapter2 problem5'      ),
      Task.new( '3:4'     , '# Test chapter3 problem4'      ),
      Task.new( '2:all'   , '# Test chapter2 all problems'  ),
      Task.new( '3:1'     , '# Test chapter3 problem1'      ),
      Task.new( '1:5'     , '# Test chapter1 problem5'      ),
      Task.new( '1:7'     , '# Test chapter1 problem7'      ),
      Task.new( '2:9'     , '# Test chapter2 problem9'      ),
      Task.new( '3:all'   , '# Test chapter3 all problems'  ),
      Task.new( '2:6'     , '# Test chapter2 problem6'      ),
      Task.new( '1:8'     , '# Test chapter1 problem8'      ),
      Task.new( '1:3'     , '# Test chapter1 problem3'      ),
      Task.new( '3:2'     , '# Test chapter3 problem2'      ),
      Task.new( '1:6'     , '# Test chapter1 problem6'      ),
      Task.new( '2:10'    , '# Test chapter2 problem10'     ),
      Task.new( '2:12'    , '# Test chapter2 problem12'     ),
      Task.new( '1:1'     , '# Test chapter1 problem1'      ),
      Task.new( '3:3'     , '# Test chapter3 problem3'      ),
      Task.new( '3:7'     , '# Test chapter3 problem7'      ),
      Task.new( '2:11'    , '# Test chapter2 problem11'     ),
      Task.new( 'add_ch'  , '# create chapter skeleton'     ),
      Task.new( '2:13'    , '# Test chapter2 problem13'     ),
      Task.new( '2:7'     , '# Test chapter2 problem7'      ),
      Task.new( '2:2'     , '# Test chapter2 problem2'      ),
      Task.new( '2:3'     , '# Test chapter2 problem3'      ),
      Task.new( '2:4'     , '# Test chapter2 problem4'      ),
      Task.new( '3:5'     , '# Test chapter3 problem5'      ),
      Task.new( '2:8'     , '# Test chapter2 problem8'      ),
      Task.new( '1:2'     , '# Test chapter1 problem2'      ),
      Task.new( '1:all'   , '# Test chapter1 all problems'  ),
      Task.new( '1:4'     , '# Test chapter1 problem4'      ),
      Task.new( '4:all'   , '# Test chapter4 all problems'  ),
      Task.new( '2:1'     , '# Test chapter2 problem1'      ),
    ]
    
    sorted_tasklist = [
      Task.new( '1:1'     , '# Test chapter1 problem1'      ),
      Task.new( '1:2'     , '# Test chapter1 problem2'      ),
      Task.new( '1:3'     , '# Test chapter1 problem3'      ),
      Task.new( '1:4'     , '# Test chapter1 problem4'      ),
      Task.new( '1:5'     , '# Test chapter1 problem5'      ),
      Task.new( '1:6'     , '# Test chapter1 problem6'      ),
      Task.new( '1:7'     , '# Test chapter1 problem7'      ),
      Task.new( '1:8'     , '# Test chapter1 problem8'      ),
      Task.new( '1:all'   , '# Test chapter1 all problems'  ),
      Task.new( '2:1'     , '# Test chapter2 problem1'      ),
      Task.new( '2:2'     , '# Test chapter2 problem2'      ),
      Task.new( '2:3'     , '# Test chapter2 problem3'      ),
      Task.new( '2:4'     , '# Test chapter2 problem4'      ),
      Task.new( '2:5'     , '# Test chapter2 problem5'      ),
      Task.new( '2:6'     , '# Test chapter2 problem6'      ),
      Task.new( '2:7'     , '# Test chapter2 problem7'      ),
      Task.new( '2:8'     , '# Test chapter2 problem8'      ),
      Task.new( '2:9'     , '# Test chapter2 problem9'      ),
      Task.new( '2:10'    , '# Test chapter2 problem10'     ),
      Task.new( '2:11'    , '# Test chapter2 problem11'     ),
      Task.new( '2:12'    , '# Test chapter2 problem12'     ),
      Task.new( '2:13'    , '# Test chapter2 problem13'     ),
      Task.new( '2:all'   , '# Test chapter2 all problems'  ),
      Task.new( '3:1'     , '# Test chapter3 problem1'      ),
      Task.new( '3:2'     , '# Test chapter3 problem2'      ),
      Task.new( '3:3'     , '# Test chapter3 problem3'      ),
      Task.new( '3:4'     , '# Test chapter3 problem4'      ),
      Task.new( '3:5'     , '# Test chapter3 problem5'      ),
      Task.new( '3:6'     , '# Test chapter3 problem6'      ),
      Task.new( '3:7'     , '# Test chapter3 problem7'      ),
      Task.new( '3:all'   , '# Test chapter3 all problems'  ),
      Task.new( '4:all'   , '# Test chapter4 all problems'  ),
      Task.new( 'add_ch'  , '# create chapter skeleton'     ),
    ]
    
    result = your_sort unsorted_tasklist do |t1,t2|      
      one_is_ch = t1.name[/^\d+:(\d+|all)$/]
      two_is_ch = t2.name[/^\d+:(\d+|all)$/]
      if one_is_ch && two_is_ch
        ch1 , prb1 = t1.name.split ':'
        ch2 , prb2 = t2.name.split ':'
        if ch1 == ch2
          if prb1 == 'all' then 1 elsif prb2 == 'all' then -1 else prb1.to_i <=> prb2.to_i end
        else
          ch1.to_i <=> ch2.to_i
        end
      elsif one_is_ch
        -1
      elsif two_is_ch
        1
      else
        t1.name <=> t2.name
      end
    end
    
    result.should == sorted_tasklist
  end
  
end

