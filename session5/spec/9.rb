require 'rubygems'
require 'nokogiri'


RSpec.describe 'trees_to_html' do
  describe 'the html infrastructure' do
    let(:html) { Nokogiri::HTML(trees_to_html '') }
    def assert_xpath(path)
      matches = html.xpath(path)
      expect(matches.size).to eq 1
      matches.first
    end

    specify 'doctype is html' do
      expect(html.internal_subset.name).to eq 'html'
    end

    specify 'the root node is <html>' do
      assert_xpath '/html'
    end

    specify 'inside <html>, is <head>' do
      assert_xpath '/html/head'
    end

    specify 'inside <head>, is a <title> of "Green Thumb Nursery"' do
      title = assert_xpath '/html/head/title'
      expect(title.text.strip).to eq "Green Thumb Nursery"
    end

    specify 'inside <html>, is a <body>' do
      assert_xpath '/html/body'
    end

    specify 'inside <body>, is an <h1> of "Catalog"' do
      h1 = assert_xpath '/html/body/h1'
      expect(h1.text.strip).to eq 'Catalog'
    end

    specify 'after the catalog, is a <table>' do
      table = assert_xpath '/html/body/table'
      hopefully_table = html.at_xpath('/html/body/h1').next_element
      expect(hopefully_table).to eq table
    end

    describe 'the first row in the table' do
      let(:first_row) { html.at_xpath('/html/body/table/tr') }

      it 'exists' do
        expect(first_row).to_not eq nil
      end

      it 'has three <td>s' do
        expect(first_row.xpath('./td').size).to eq 3
      end

      describe 'its <td>s' do
        let(:tds) { first_row.xpath './td' }
        specify 'the first td\'s text is "Type of tree"' do
          expect(tds[0].text.strip).to eq "Type of tree"
        end
        specify 'the second td\'s text is "Size of the tree"' do
          expect(tds[1].text.strip).to eq "Size of the tree"
        end
        specify 'the third td\'s text is "Price of the tree"' do
          expect(tds[2].text.strip).to eq "Price of the tree"
        end
      end
    end
  end




  trees = {
    "American Redbud Tree, which ships at 1 to 2 feet, cost $5.95"     => ["American Redbud Tree"   , "1 to 2 feet", "$5.95" ],
    "Autumn Flowering Cherry, which ships at 2 to 4 feet, cost: $8.95" => ["Autumn Flowering Cherry", "2 to 4 feet", "$8.95" ],
    "Black Walnut Tree; which ships at 1 to 2 feet, cost: $4.95"       => ["Black Walnut Tree"      , "1 to 2 feet", "$4.95" ],
    "Cherokee Chief Dogwood, which ships at 2 to 4 feet, cost: $8.95"  => ["Cherokee Chief Dogwood" , "2 to 4 feet", "$8.95" ],
    "English Walnut Tree, Which ships at 1 to 2 feet, cost $10.95"     => ["English Walnut Tree"    , "1 to 2 feet", "$10.95"],
    "Flowering Peach Tree, which ships at 2 to 4 feet, cost: $7.95"    => ["Flowering Peach Tree"   , "2 to 4 feet", "$7.95" ],
    "Flowering Pear Tree, which ships at 2 to 4 feet, cost: $8.50"     => ["Flowering Pear Tree"    , "2 to 4 feet", "$8.50" ],
    "Hydrangea Tree, which ships at 1 to 2 feet, cost: $5.95"          => ["Hydrangea Tree"         , "1 to 2 feet", "$5.95" ],
    "Pecan Tree, which ships at 1 to 2 feet, cost: $5.95"              => ["Pecan Tree"             , "1 to 2 feet", "$5.95" ],
    "Purple Leaf Plum Tree, which ships at 2 to 3 feet, cost: $5.95"   => ["Purple Leaf Plum Tree"  , "2 to 3 feet", "$5.95" ],
    "Royal Empress Tree, which ships @ 2 to 4 feet, cost: $4.50"       => ["Royal Empress Tree"     , "2 to 4 feet", "$4.50" ],
    "White Dogwood Tree, which ships at 2 to 3 feet, cost: $5.95"      => ["White Dogwood Tree"     , "2 to 3 feet", "$5.95" ],
  }

  trees.each do |raw, expected|
    context "when passed the line #{raw.inspect}" do
      let(:html) { Nokogiri::HTML(trees_to_html raw) }
      it 'has one tree listed' do
        size = html.xpath('/html/body/table/tr[position() > 1]').size
        expect(size).to eq 1
      end
      describe 'the <tr>' do
        let(:tds) { html.xpath('/html/body/table/tr[position() = 2]/td') }
        it 'has three tds' do
          expect(tds.size).to eq 3
        end
        specify "the first td has the text #{expected[0].inspect}" do
          expect(tds[0].text.strip).to eq expected[0]
        end
        specify "the second td has the text #{expected[1].inspect}" do
          expect(tds[1].text.strip).to eq expected[1]
        end
        specify "the third td has the text #{expected[2].inspect}" do
          expect(tds[2].text.strip).to eq expected[2]
        end
      end
    end
  end

  trees.each_slice 2 do |a, b|
    raw = "#{a.first}\n#{b.first}"
    expected = [a.last, b.last]
    context "when passed #{raw.inspect}" do
      let(:doc) { Nokogiri::HTML(trees_to_html raw) }
      it 'has two trees listed' do
        size = doc.xpath('/html/body/table/tr[position() > 1]').size
        expect(size).to eq 2
      end
      describe 'the first <tr>' do
        let(:tds) { doc.xpath('/html/body/table/tr[position() = 2]/td') }
        it 'has three tds' do
          expect(tds.size).to eq 3
        end
        specify "the first td has the text #{a.last[0].inspect}" do
          expect(tds[0].text.strip).to eq a.last[0]
        end
        specify "the second td has the text #{a.last[1].inspect}" do
          expect(tds[1].text.strip).to eq a.last[1]
        end
        specify "the third td has the text #{a.last[2].inspect}" do
          expect(tds[2].text.strip).to eq a.last[2]
        end
      end
      describe 'the second <tr>' do
        let(:tds) { doc.xpath('/html/body/table/tr[position() = 3]/td') }
        it 'has three tds' do
          expect(tds.size).to eq 3
        end
        specify "the first td's text is #{b.last[0].inspect}" do
          expect(tds[0].text.strip).to eq b.last[0]
        end
        specify "the second td's text is #{b.last[1].inspect}" do
          expect(tds[1].text.strip).to eq b.last[1]
        end
        specify "the third td's text is #{b.last[2].inspect}" do
          expect(tds[2].text.strip).to eq b.last[2]
        end
      end
    end
  end

  describe 'when passed the entire block of text' do
    text = trees.map(&:first).join("\n")
    doc  = Nokogiri::HTML(trees_to_html text)
    trs  = doc.xpath('/html/body/table/tr[position() > 1]')
    it 'has twelve trs' do
      expect(trs.size).to eq 12
    end
    trees.each.with_index do |(raw, (type, size, price)), index|
      describe "<tr> at position #{index}" do
        it 'has three tds' do
          expect(trs[index].xpath('./td').size).to eq 3
        end
        specify "the first td's text is #{type.inspect}" do
          expect(trs[index].xpath('./td')[0].text.strip).to eq type
        end
        specify "the second td's text is #{size.inspect}" do
          expect(trs[index].xpath('./td')[1].text.strip).to eq size
        end
        specify "the third td's text is #{price.inspect}" do
          expect(trs[index].xpath('./td')[2].text.strip).to eq price
        end
      end
    end
  end
end
