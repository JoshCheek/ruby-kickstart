RSpec.describe "grade" do
  context "for non book reader" do
    0.upto 9 do |num_books|
      it "returns \"D\" when given #{num_books} books" do
        expect(grade num_books, false).to eq "D"
      end
    end

    10.upto 20 do |num_books|
      it "returns \"C\" when given #{num_books} books" do
        expect(grade num_books, false).to eq "C"
      end
    end

    [21,30,500].each do |num_books|
      it "returns \"B\" when given #{num_books} books" do
        expect(grade num_books, false).to eq "B"
      end
    end
  end

  context "for book reader" do
    0.upto 9 do |num_books|
      it "returns \"C\" when given #{num_books} books" do
        expect(grade num_books, true).to eq "C"
      end
    end

    10.upto 20 do |num_books|
      it "returns \"B\" when given #{num_books} books" do
        expect(grade num_books, true).to eq "B"
      end
    end

    [21,30,500].each do |num_books|
      it "returns \"A\" when given #{num_books} books" do
        expect(grade num_books, true).to eq "A"
      end
    end
  end
end
