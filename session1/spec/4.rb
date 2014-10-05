describe "grade" do

  context "for non book reader" do
    0.upto 9 do |num_books|
      it "should return \"D\" when given #{num_books} books" do
        expect(grade(num_books, false)).to be_eql "D"
      end
    end

    10.upto 20 do |num_books|
      it "should return \"C\" when given #{num_books} books" do
        expect(grade(num_books, false)).to be_eql "C"
      end
    end

    [21,30,500].each do |num_books|
      it "should return \"B\" when given #{num_books} books" do
        expect(grade(num_books, false)).to be_eql "B"
      end
    end
  end

  context "for book reader" do
    0.upto 9 do |num_books|
      it "should return \"C\" when given #{num_books} books" do
        expect(grade(num_books, true)).to be_eql "C"
      end
    end

    10.upto 20 do |num_books|
      it "should return \"B\" when given #{num_books} books" do
        expect(grade(num_books, true)).to be_eql "B"
      end
    end

    [21,30,500].each do |num_books|
      it "should return \"A\" when given #{num_books} books" do
        expect(grade(num_books, true)).to be_eql "A"
      end
    end
  end

end
