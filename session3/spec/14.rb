describe 'problem_14 with :problem => :count_clumps' do

  it 'should return 2 when given 1, 2, 2, 3, 4, 4' do
    problem_14(1, 2, 2, 3, 4, 4, :problem => :count_clumps).should == 2
  end
  
  it 'should return 2 when given 1, 1, 2, 1, 1' do
    problem_14(1, 1, 2, 1, 1, :problem => :count_clumps).should == 2
  end
  
  it 'should return 1 when given 1, 1, 1, 1, 1' do
    problem_14(1, 1, 1, 1, 1, :problem => :count_clumps).should == 1
  end
  
  it 'should return 0 when given 1, 2, 3' do
    problem_14(1, 2, 3, :problem => :count_clumps).should == 0
  end
  
  it 'should return 4 when given 2, 2, 1, 1, 1, 2, 1, 1, 2, 2' do
    problem_14(2, 2, 1, 1, 1, 2, 1, 1, 2, 2, :problem => :count_clumps).should == 4
  end
  
  it 'should return 4 when given 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2' do
    problem_14(0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2, :problem => :count_clumps).should == 4
  end
  
  it 'should return 5 when given 0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2' do
    problem_14(0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2, :problem => :count_clumps).should == 5
  end
  
  it 'should return 5 when given 0, 0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2' do
    problem_14(0, 0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2, :problem => :count_clumps).should == 5
  end
  
  it 'should return 0 when given no arguments' do
    problem_14(:problem => :count_clumps).should == 0
  end
  
end


describe 'problem_14 with no hash on the end' do
  it 'should return 2 when given 1, 1, 2, 1, 1' do
    problem_14(1, 1, 2, 1, 1).should == 2
  end
  
  it 'should return 1 when given 1, 1, 1, 1, 1' do
    problem_14(1, 1, 1, 1, 1).should == 1
  end
end


describe 'count_clumps' do

  it 'should return 2 when given 1, 2, 2, 3, 4, 4' do
    count_clumps(1, 2, 2, 3, 4, 4).should == 2
  end
  
  it 'should return 2 when given 1, 1, 2, 1, 1' do
    count_clumps(1, 1, 2, 1, 1).should == 2
  end
  
  it 'should return 1 when given 1, 1, 1, 1, 1' do
    count_clumps(1, 1, 1, 1, 1).should == 1
  end
  
  it 'should return 0 when given 1, 2, 3' do
    count_clumps(1, 2, 3).should == 0
  end
  
  it 'should return 4 when given 2, 2, 1, 1, 1, 2, 1, 1, 2, 2' do
    count_clumps(2, 2, 1, 1, 1, 2, 1, 1, 2, 2).should == 4
  end
  
  it 'should return 4 when given 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2' do
    count_clumps(0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2).should == 4
  end
  
  it 'should return 5 when given 0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2' do
    count_clumps(0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2).should == 5
  end
  
  it 'should return 5 when given 0, 0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2' do
    count_clumps(0, 0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2).should == 5
  end
  
  it 'should return 0 when given no arguments' do
    count_clumps().should == 0
  end
  
end







describe 'same_ends' do
  it 'should return false when given 1, 5, 6, 45, 99, 13, 5, 6' do
    same_ends(1, 5, 6, 45, 99, 13, 5, 6 ).should be_false
  end
  
  it 'should return true when given 2, 5, 6, 45, 99, 13, 5, 6' do
    same_ends(2, 5, 6, 45, 99, 13, 5, 6).should be_true
  end
  
  it 'should return false when given 3, 5, 6, 45, 99, 13, 5, 6' do
    same_ends(3, 5, 6, 45, 99, 13, 5, 6).should be_false
  end
  
  it 'should return true when given 1, 1, 2, 5, 2, 1' do
    same_ends(1, 1, 2, 5, 2, 1).should be_true
  end
  
  it 'should return false when given 2, 1, 2, 5, 2, 1' do
    same_ends(2, 1, 2, 5, 2, 1).should be_false
  end
  
  it 'should return true when given 0, 1, 2, 5, 2, 1' do
    same_ends(0, 1, 2, 5, 2, 1).should be_true
  end
  
  it 'should return true when given 5, 1, 2, 5, 2, 1' do
    same_ends(5, 1, 2, 5, 2, 1).should be_true
  end
  
  it 'should return true when given 0, 1, 1, 1' do
    same_ends(0, 1, 1, 1).should be_true
  end
  
  it 'should return true when given 1, 1, 1, 1' do
    same_ends(1, 1, 1, 1).should be_true
  end
  
  it 'should return true when given 2, 1, 1, 1' do
    same_ends(2, 1, 1, 1).should be_true
  end
  
  it 'should return true when given 3, 1, 1, 1' do
    same_ends(3, 1, 1, 1).should be_true
  end
  
  it 'should return true when given 1, 1' do
    same_ends(1, 1).should be_true
  end
  
  it 'should return true when given 0' do
    same_ends(0).should be_true
  end
  
  it 'should return false when given 1, 4, 2, 4, 5' do
    same_ends(1, 4, 2, 4, 5).should be_false
  end
  
end


describe 'problem_14 with :problem => :same_ends' do
  it 'should return false when given 1, 5, 6, 45, 99, 13, 5, 6, :problem => :same_ends' do
    problem_14(1, 5, 6, 45, 99, 13, 5, 6, :problem => :same_ends ).should be_false
  end

  it 'should return true when given 2, 5, 6, 45, 99, 13, 5, 6, :problem => :same_ends' do
    problem_14(2, 5, 6, 45, 99, 13, 5, 6, :problem => :same_ends).should be_true
  end

  it 'should return false when given 3, 5, 6, 45, 99, 13, 5, 6, :problem => :same_ends' do
    problem_14(3, 5, 6, 45, 99, 13, 5, 6, :problem => :same_ends).should be_false
  end

  it 'should return true when given 1, 1, 2, 5, 2, 1, :problem => :same_ends' do
    problem_14(1, 1, 2, 5, 2, 1, :problem => :same_ends).should be_true
  end

  it 'should return false when given 2, 1, 2, 5, 2, 1' do
    problem_14(2, 1, 2, 5, 2, 1, :problem => :same_ends).should be_false
  end

  it 'should return true when given 0, 1, 2, 5, 2, 1' do
    problem_14(0, 1, 2, 5, 2, 1, :problem => :same_ends).should be_true
  end

  it 'should return true when given 5, 1, 2, 5, 2, 1' do
    problem_14(5, 1, 2, 5, 2, 1, :problem => :same_ends).should be_true
  end

  it 'should return true when given 0, 1, 1, 1' do
    problem_14(0, 1, 1, 1, :problem => :same_ends).should be_true
  end

  it 'should return true when given 1, 1, 1, 1' do
    problem_14(1, 1, 1, 1, :problem => :same_ends).should be_true
  end

  it 'should return true when given 2, 1, 1, 1' do
    problem_14(2, 1, 1, 1, :problem => :same_ends).should be_true
  end

  it 'should return true when given 3, 1, 1, 1' do
    problem_14(3, 1, 1, 1, :problem => :same_ends).should be_true
  end

  it 'should return true when given 1, 1' do
    problem_14(1, 1, :problem => :same_ends).should be_true
  end

  it 'should return true when given 0' do
    problem_14(0, :problem => :same_ends).should be_true
  end

  it 'should return false when given 1, 4, 2, 4, 5' do
    problem_14(1, 4, 2, 4, 5, :problem => :same_ends).should be_false
  end
end
