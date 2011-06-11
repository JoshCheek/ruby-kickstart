describe 'middle' do
  
  it 'should be defined' do
    method(:middle).should be
  end


  list = nil

  1.upto 10 do |i|
    head      =  { :data => i, :next => list }
    list      =  head
    expected  =  (i/2.0).ceil
    it "should find #{expected} for #{head.inspect}" do
      middle(head).should == expected
    end
  end

end

