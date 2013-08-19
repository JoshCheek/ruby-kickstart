=begin rdoc

===
 text = <<eot

 Given a number, n, return 10 if it is even, and 20 if it is odd.

 The examples run:
  ten_twenty( 5 ) # => 20
  ten_twenty( 6 ) # => 10
  ten_twenty( 0 ) # => 10
  1_000_000.step -1_000_000 , -101_275 do | i |
     if i % 2 == 0
        ten_twenty( i ) # => 10
    else
        ten_twenty( i ) # => 20
    end
  end

  def ten_twenty( n )
    your code goes here
  end

 eot

 describe text do
  
  it 'should return 20 when passed 5' do
    ten_twenty( 5 ).should == 20
  end
  
  it 'should return 10 when passed 6' do
    ten_twenty( 6 ).should == 10
  end
  
  it 'should return 10 when passed 0' do
    ten_twenty( 0 ).should == 10
  end
  
  1_000_000.step -1_000_000 , -101_275 do | i |
      it "should return #{ 10 } when passed #{ i }" do
        ten_twenty( i ).should == 10
      end
    else
      it "should return #{20} when passed #{ i }" do
        ten_twenty( i ).should == 20
      end
    end
  end
  
 end

=end



 text = <<eot

 Given a number, n, return 10 if it is even, and 20 if it is odd.

 The examples run:
  ten_twenty( 5 ) # => 20
  ten_twenty( 6 ) # => 10
  ten_twenty( 0 ) # => 10
  1_000_000.step -1_000_000 , -101_275 do | i |
     if i % 2 == 0
        ten_twenty( i ) # => 10
    else
        ten_twenty( i ) # => 20
    end
  end

  def ten_twenty( n )
    your code goes here
	end

eot

 describe text do
  
  it 'should return 20 when passed 5' do
    ten_twenty( 5 ).should == 20
  end
  
  it 'should return 10 when passed 6' do
    ten_twenty( 6 ).should == 10
  end
  
  it 'should return 10 when passed 0' do
    ten_twenty( 0 ).should == 10
  end
  
  1_000_000.step -1_000_000 , -101_275 do | i |
    if i % 2 == 0
      it "should return #{ 10 } when passed #{ i }" do
        ten_twenty( i ).should == 10
      end
    else
      it "should return #{ 20 } when passed #{ i }" do
        ten_twenty( i ).should == 20
      end
    end
  end
  
end

