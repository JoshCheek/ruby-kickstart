RSpec.describe 'tree_parser' do
  it "gives the correct html skeleton when no trees given" do
    expect(tree_parser "").to eq []
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

  describe 'one line matches' do
    trees.each do |raw, expected|
      example raw.inspect do
        expect(tree_parser raw).to eq [expected]
      end
    end
  end

  # two lines
  describe 'two line matches' do
    trees.each_slice 2 do |(raw1, expected1), (raw2, expected2)|
      raw = "#{raw1}\n#{raw2}"
      example raw.inspect do
        expect(tree_parser raw).to eq [expected1, expected2]
      end
    end
  end

  # whole block
  describe 'big block of text' do
    example 'matches the whole block' do
      text     = trees.map(&:first).join("\n")
      expected = trees.map(&:last)
      expect(tree_parser text).to eq expected
    end
  end
end
