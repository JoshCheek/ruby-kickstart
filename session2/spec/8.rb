describe 'got_three?' do
  specify { got_three?([1, 2, 2, 2, 3]).should be }
  specify { got_three?(['a', 'a', 'b']).should_not be }
  specify { got_three?(['a', 'a', 'a']).should be }
  specify { got_three?([1, 2, 1, 1]).should_not be }
  specify { got_three?([]).should_not be }
  specify { got_three?([1]).should_not be }
  specify { got_three?([1,2]).should_not be }
  specify { got_three?([1,2,3]).should_not be }
  specify { got_three?([1,2,3,2,2]).should_not be }
  specify { got_three?([1,1,2,1,1]).should_not be }
  specify { got_three?([1,2,5,9,3,5,5,5,10,4,3,2]).should be }
  specify { got_three?(['a','a','a']).should be }
  specify { got_three?([1,2,2,2]).should be }
  specify { got_three?([1,1,1,2]).should be }
  specify { got_three?([2,1,1,1]).should be }
  specify { got_three?([2,2,2,1]).should be }
  specify { got_three?([1,5,6,8,8,4,3,6,4,4,6,1,2,3,3,3]).should be }
  specify { got_three?([1,21,15,17,9,19,17,24,25,4,10,3,23,5,21,13,16,12,14,15,3,20,3,22,7,20,7,11,15,10,6,24,2,2,19,5,4,21,6,17,1,6,16,4,22,25,18,18,20,11,8,9,2,16,19,13,7,10,23,25,11,8,24,18,5,14,14,8,22,23,1,9,12,12,13]).should_not be }
  specify { got_three?([1,21,15,17,9,19,17,24,25,4,10,3,23,5,21,13,16,12,14,15,3,20,3,22,7,20,7,11,15,10,6,24,2,2,19,5,4,21,6,17,1,6,16,4,22,25,18,18,20,11,8,9,2,16,19,13,7,10,23,25,11,8,24,18,5,14,14,14,8,22,23,1,9,12,12,13]).should be }
end