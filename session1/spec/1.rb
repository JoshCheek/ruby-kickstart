=begin rdoc

===
 text = <<eot

 Your task is to finish the method so that it returns a number 20 less than that number multiplied by 5.

 The tests run:
  arithmetic1( 10 )     # => 30
  arithmeitc1( 10.5 )   # => 32.5
  arithmeitc1( -6 )     # => -50
  arithmetic1( 100 )    # => 480

  def arithmetic1( n )  
    Your code goes here.
  end

 eot

 describe text do

   it 'should return 30 when passed 10' do
     arithmetic1( 10 ).should == 30
   end
  
   it 'should return 32.5 when passed 10.5' do
     arithmetic1( 10.5 ).should == 32.5
   end
  
   it 'should return -50 when passed -6' do
     arithmetic1( -6 ).should == -50
   end
  
   it 'should return 480 when passed 100' do
     arithmetic1( 100 ).should == 480
   end
  
 end

=end

text = <<eot

 Your task is to finish the method so that it returns a number 20 less than that number multiplied by 5.

 The tests run:
  arithmetic1( 10 )     # => 30
  arithmeitc1( 10.5 )   # => 32.5
  arithmeitc1( -6 )     # => -50
  arithmetic1( 100 )    # => 480

  def arithmetic1( n )  
    Your code goes here.
  end

eot

 describe text do

   it 'should return 30 when passed 10' do
     arithmetic1( 10 ).should == 30
   end
  
   it 'should return 32.5 when passed 10.5' do
     arithmetic1( 10.5 ).should == 32.5
   end
  
   it 'should return -50 when passed -6' do
     arithmetic1( -6 ).should == -50
   end
  
   it 'should return 480 when passed 100' do
     arithmetic1( 100 ).should == 480
   end
  
 end
