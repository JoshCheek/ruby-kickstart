describe 'first_object' do  
  specify { first_object(1, nil, nil).should == 1 }
  specify { first_object(nil, 1, nil).should == 1 }
  specify { first_object(nil, nil, 1).should == 1 }
  specify { first_object(nil, 1, 2).should == 1 }
  specify { first_object(nil, nil, nil).should == nil }
  specify { first_object(false, false, false).should == nil }
  specify { first_object(false, false, true).should == true }
  specify { first_object(5, 4, 3).should == 5 }
  specify { first_object(5, nil, 3).should == 5 }
  specify { first_object(5, 4, nil).should == 5 }
end
