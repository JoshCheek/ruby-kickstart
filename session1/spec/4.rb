=begin rdoc

===
 text = <<eot

 A grad student at a local university thinks he has discovered a formula to
 predict what kind of grades a person will get. He says if you own less than 
 10 books, you will get a "D". If you own 10 to 20 books, you will get a "C", 
 and if you own more than 20 books, you will get a "B".
 He further hypothesizes that if you actually read your books, then you will
 get a full letter grade higher in every case.

 The examples run:
  grade( 4,  false )  # => "D"
  grade( 4,  true )   # => "C"
  grade( 15, true )   # => "B"

  def grade( num_books, reads_books )
    Your code goes here.
  end

 eot

 describe text do
  
  context 'for non book reader' do
    0.upto 9 do | num_books |
      it "should return \"D\" when given #{ num_books } books" do
        grade( num_books, false ).should == "D"
      end
    end
    10.upto 20 do | num_books |
      it "should return \"C\" when given #{ num_books } books" do
        grade( num_books, false ).should == "C"
      end
    end
    [ 21, 30, 500 ].each do | num_books |
      it "should return \"B\" when given #{ num_books } books" do
        grade( num_books, false ).should == "B"
      end
    end
  end
  
  context 'for book reader' do
    0.upto 9 do | num_books |
      it "should return \"C\" when given #{ num_books } books" do
        grade( num_books, true ).should == "C"
      end
    end
    10.upto 20 do | num_books |
      it "should return \"B\" when given #{ num_books } books" do
        grade( num_books, true ).should == "B"
      end
    end
    [ 21, 30, 500 ].each do | num_books |
      it "should return \"A\" when given #{ num_books } books" do
        grade( num_books, true ).should == "A"
      end
    end
  end
 end

=end

text = <<eot

A grad student at a local university thinks he has discovered a formula to
predict what kind of grades a person will get. He says if you own less than 
10 books, you will get a "D". If you own 10 to 20 books, you will get a "C", 
and if you own more than 20 books, you will get a "B".
He further hypothesizes that if you actually read your books, then you will
get a full letter grade higher in every case.

The examples run:
 grade( 4,  false )  # => "D"
 grade( 4,  true )   # => "C"
 grade( 15, true )   # => "B"

 def grade( num_books, reads_books )
    Your code goes here.
 end

eot

describe text do
  
  context 'for non book reader' do
    0.upto 9 do | num_books |
      it "should return \"D\" when given #{ num_books } books" do
        grade( num_books, false ).should == "D"
      end
    end
    10.upto 20 do | num_books |
      it "should return \"C\" when given #{ num_books } books" do
        grade( num_books, false ).should == "C"
      end
    end
    [ 21, 30, 500 ].each do | num_books |
      it "should return \"B\" when given #{ num_books } books" do
        grade( num_books, false ).should == "B"
      end
    end
  end
  
  context 'for book reader' do
    0.upto 9 do | num_books |
      it "should return \"C\" when given #{ num_books } books" do
        grade( num_books, true ).should == "C"
      end
    end
    10.upto 20 do | num_books |
      it "should return \"B\" when given #{ num_books } books" do
        grade( num_books, true ).should == "B"
      end
    end
    [ 21, 30, 500 ].each do | num_books |
      it "should return \"A\" when given #{ num_books } books" do
        grade( num_books, true ).should == "A"
      end
    end
  end
end