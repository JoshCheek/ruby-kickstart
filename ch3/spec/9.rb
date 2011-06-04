# Write a method that initializes an Array
# it receives one parameter, which is 5 by default, but can be overridden by the user
# The parameter determines the size of the Array to initialize
#
# If a block is submitted, use that block to initialize ach index in the Array (pass it the current index)
#
# If a block is not submitted, initialize the Array to 100 times the array's index, as a String
#
# CONDITIONS:
#   Do not loop through the Array to initialize it, instead, use the block form
#
# HINTS:
#   Remember that the Array initializer will pass the index being initialized to your block that is doing the initializing
#   (if you wish to use blocks) Remember that in the block you pass, to Array.new, you can yield to the block the user passed
#   (if you wish to use procs)  You can place the block you received into the block spot with the ampersand ( ampersand to get it out, and to put it in )
#
# EXAMPLES:
#   
# array_init(2) { |i| i.to_s }    # => [ '0' , '1' ]
# array_init { |i| i.to_s }       # => [ '0' , '1' , '2' , '3' , '4' , '5' ]
# array_init 2                    # => [ '0' , '100' ]
# array_init                      # => [ '0' , '100' , '200' , '300' , 400' , '500' ]
# array_init { 'hi }              # => [ 'hi' , 'hi' , 'hi' , 'hi' ]


describe 'array_init' do
  
  it "should return [ '0' , '1' ] when called as array_init(2) { |i| i.to_s }" do
    array_init(2) { |i| i.to_s }.should == [ '0' , '1' ]
  end

  it "should return [ '0' , '1' , '2' , '3' , '4' ] when called as array_init { |i| i.to_s }" do
    array_init { |i| i.to_s }.should == [ '0' , '1' , '2' , '3' , '4' ]
  end

  it "should return [ '0' , '100' ] when called as array_init 2" do
    array_init(2).should == [ '0' , '100' ]
  end
  
  it "should return [ '0' , '100' , '200' , '300' , 400' ] when called as array_init" do
    array_init.should == [ '0' , '100' , '200' , '300' , '400' ]
  end
  
  it "should return [ 'hi' , 'hi' , 'hi' , 'hi' ] when called as array_init { 'hi }" do
    array_init { 'hi' }.should == [ 'hi' , 'hi' , 'hi' , 'hi' , 'hi' ]
  end

  it "should return ['hi'] * 100 when called as array_init(100){ 'hi' }" do
    array_init(100) { 'hi' }.should == ['hi'] * 100
  end
  
  it 'should work for a more complicated block' do
    result = array_init 10 do |i|
      if i % 2 == 0
        i * 200
      else
        i * -5
      end
    end
    result.should == [ 0 , -5 , 400 , -15 , 800 , -25 , 1200 , -35 , 1600 , -45 ]
  end
  
end
