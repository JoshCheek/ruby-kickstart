describe 'grade' do
  
  context 'for non book reader' do
    0.upto 9 do |num_books|
      it "should return \"D\" when given #{num_books} books" do
        grade(num_books,false).should == "D"
      end
    end
    10.upto 20 do |num_books|
      it "should return \"C\" when given #{num_books} books" do
        grade(num_books,false).should == "C"
      end
    end
    [21,30,500].each do |num_books|
      it "should return \"B\" when given #{num_books} books" do
        grade(num_books,false).should == "B"
      end
    end
  end
  
  context 'for book reader' do
    0.upto 9 do |num_books|
      it "should return \"C\" when given #{num_books} books" do
        grade(num_books,true).should == "C"
      end
    end
    10.upto 20 do |num_books|
      it "should return \"B\" when given #{num_books} books" do
        grade(num_books,true).should == "B"
      end
    end
    [21,30,500].each do |num_books|
      it "should return \"A\" when given #{num_books} books" do
        grade(num_books,true).should == "A"
      end
    end
  end
end