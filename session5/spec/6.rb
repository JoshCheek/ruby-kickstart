describe 'bar_regex' do
  
  it 'should exist' do
    method(:bar_regex).should be
  end
  
  specify { 'bar'[bar_regex].should == 'bar'  }
  specify { 'bar at the bar'.scan(bar_regex).size.should == 2 }
  specify { "ba\nr"[bar_regex].should be_nil }
  specify { "Bar"[bar_regex].should == 'Bar' }
  specify { "bAr"[bar_regex].should be_nil }
  specify { "BAR"[bar_regex].should be_nil }
  specify { "Barrier"[bar_regex].should be_nil }
  specify { "lowbar"[bar_regex].should be_nil }
  specify { "bar Bar bar.bar".scan(bar_regex).count.should == 4 }
  
end