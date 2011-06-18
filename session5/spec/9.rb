require 'rubygems'
require 'nokogiri'


describe 'trees_to_html' do
  
  it 'should be a method' do
    method(:trees_to_html).should be
  end
  
  describe 'the html infrastructure' do
    subject { Nokogiri::HTML(trees_to_html '') }
    specify 'the first line should contain the doctype' do
      # I don't know how to get the doctype, so just using regex for this one
      first_line = trees_to_html('').strip.lines.first
      first_line.should be
      first_line.strip.should == '<!doctype html>'
    end
    specify 'the root node should be html' do
      should have(1).xpath('/html')
    end
    specify 'inside html, you should have a head' do
      should have(1).xpath('/html/head')
    end
    specify 'inside the head, you should have a title of "Green Thumb Nursery"' do
      should have(1).xpath('/html/head/title')
      subject.at_xpath('/html/head/title').text.strip.should == "Green Thumb Nursery"
    end
    specify 'inside the html, you should have a body' do
      should have(1).xpath('/html/body')
    end
    specify 'inside the body, you should have an h1 of "Catalog"' do
      should have(1).xpath('/html/body/h1')
      subject.at_xpath('/html/body/h1').text.strip.should == 'Catalog'
    end
    specify 'after the catalog, you should have a table' do
      should have(1).xpath('/html/body/table')
      subject.at_xpath('/html/body/h1').next_element.should == subject.at_xpath('/html/body/table')
    end
    describe 'the first row in the table' do
      subject { Nokogiri::HTML(trees_to_html '').at_xpath('/html/body/table/tr') }
      it { should be }
      it 'should have three table data' do
        should have(3).xpath('./td')
      end
      describe 'its <td>s' do
        subject { Nokogiri::HTML(trees_to_html '').xpath('/html/body/table/tr/td') }
        specify %q(the first td's text should be "Type of tree") do
          subject[0].text.strip.should == "Type of tree"
        end
        specify %q(the second td's text should be "Size of the tree") do
          subject[1].text.strip.should == "Size of the tree"
        end
        specify %q(the third td's text should be "Price of the tree") do
          subject[2].text.strip.should == "Price of the tree"
        end
      end
    end
  end
  
  
  
  
  trees = {
    "American Redbud Tree, which ships at 1 to 2 feet, cost $5.95"      => [ "American Redbud Tree"    , "1 to 2 feet" , "$5.95"  ],
    "Autumn Flowering Cherry, which ships at 2 to 4 feet, cost: $8.95"  => [ "Autumn Flowering Cherry" , "2 to 4 feet" , "$8.95"  ],
    "Black Walnut Tree; which ships at 1 to 2 feet, cost: $4.95"        => [ "Black Walnut Tree"       , "1 to 2 feet" , "$4.95"  ],
    "Cherokee Chief Dogwood, which ships at 2 to 4 feet, cost: $8.95"   => [ "Cherokee Chief Dogwood"  , "2 to 4 feet" , "$8.95"  ],
    "English Walnut Tree, Which ships at 1 to 2 feet, cost $10.95"      => [ "English Walnut Tree"     , "1 to 2 feet" , "$10.95" ],
    "Flowering Peach Tree, which ships at 2 to 4 feet, cost: $7.95"     => [ "Flowering Peach Tree"    , "2 to 4 feet" , "$7.95"  ],
    "Flowering Pear Tree, which ships at 2 to 4 feet, cost: $8.50"      => [ "Flowering Pear Tree"     , "2 to 4 feet" , "$8.50"  ],
    "Hydrangea Tree, which ships at 1 to 2 feet, cost: $5.95"           => [ "Hydrangea Tree"          , "1 to 2 feet" , "$5.95"  ],
    "Pecan Tree, which ships at 1 to 2 feet, cost: $5.95"               => [ "Pecan Tree"              , "1 to 2 feet" , "$5.95"  ],
    "Purple Leaf Plum Tree, which ships at 2 to 3 feet, cost: $5.95"    => [ "Purple Leaf Plum Tree"   , "2 to 3 feet" , "$5.95"  ],
    "Royal Empress Tree, which ships @ 2 to 4 feet, cost: $4.50"        => [ "Royal Empress Tree"      , "2 to 4 feet" , "$4.50"  ],
    "White Dogwood Tree, which ships at 2 to 3 feet, cost: $5.95"       => [ "White Dogwood Tree"      , "2 to 3 feet" , "$5.95"  ],
  }
    
  trees.each do |raw, expected|
    context "when passed the line #{raw.inspect}" do
      doc = Nokogiri::HTML(trees_to_html raw)
      it 'should have one tree listed' do
        doc.xpath('/html/body/table/tr[position() > 1]').size.should == 1
      end
      describe 'the <tr>' do
        subject { doc.xpath('/html/body/table/tr[position() = 2]/td') }
        it 'should have three tds' do
          subject.size.should == 3
        end
        specify "the first td should have text of #{expected[0].inspect}" do
          subject[0].text.strip.should == expected[0]
        end
        specify "the second td should have text of #{expected[1].inspect}" do
          subject[1].text.strip.should == expected[1]
        end
        specify "the third td should have text of #{expected[2].inspect}" do
          subject[2].text.strip.should == expected[2]
        end
      end
    end
  end
  
  trees.each_slice 2 do |a, b|
    raw = "#{a.first}\n#{b.first}"
    expected = [a.last, b.last]
    context "when passed #{raw.inspect}" do
      doc = Nokogiri::HTML(trees_to_html raw)
      it 'should have two trees listed' do
        doc.xpath('/html/body/table/tr[position() > 1]').size.should == 2
      end
      describe 'the first <tr>' do
        subject { doc.xpath('/html/body/table/tr[position() = 2]/td') }
        it 'should have three tds' do
          subject.size.should == 3
        end
        specify "the first td should have text of #{a.last[0].inspect}" do
          subject[0].text.strip.should == a.last[0]
        end
        specify "the second td should have text of #{a.last[1].inspect}" do
          subject[1].text.strip.should == a.last[1]
        end
        specify "the third td should have text of #{a.last[2].inspect}" do
          subject[2].text.strip.should == a.last[2]
        end
      end
      describe 'the second <tr>' do
        subject { doc.xpath('/html/body/table/tr[position() = 3]/td') }
        it 'should have three tds' do
          subject.size.should == 3
        end
        specify "the first td should have text of #{b.last[0].inspect}" do
          subject[0].text.strip.should == b.last[0]
        end
        specify "the second td should have text of #{b.last[1].inspect}" do
          subject[1].text.strip.should == b.last[1]
        end
        specify "the third td should have text of #{b.last[2].inspect}" do
          subject[2].text.strip.should == b.last[2]
        end
      end
    end
  end
  
  describe 'when passed the entire block of text' do
    text = trees.map(&:first).join("\n")
    doc = Nokogiri::HTML(trees_to_html text)
    trs = doc.xpath('/html/body/table/tr[position() > 1]')
    it 'should have twelve trs' do
      trs.size.should == 12
    end
    trees.each.with_index do |(raw, (type, size, price)), index|
      describe "<tr> at position #{index}" do
        it 'should have three tds' do
          trs[index].xpath('./td').size.should == 3
        end
        specify "the first td should have text of #{type.inspect}" do
          trs[index].xpath('./td')[0].text.strip.should == type
        end
        specify "the second td should have text of #{size.inspect}" do
          trs[index].xpath('./td')[1].text.strip.should == size
        end
        specify "the third td should have text of #{price.inspect}" do
          trs[index].xpath('./td')[2].text.strip.should == price
        end
      end
    end
  end
  
end