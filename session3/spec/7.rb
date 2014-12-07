RSpec.describe 'HTMLTag' do
  it "generates \"<li style='color:#FF0000;'>baseball</li>\\n\" when given 'li' , 'baseball' , :multiline => false , :color => :red" do
    html = HTMLTag.new('li', 'baseball', :multiline => false, :color => :red).to_s.chomp
    expect(html).to match %r{<li\s+style=('|")color:#FF0000;(\1)\s*>baseball</li>}i
  end

  it "generates \"<li style='color:#00FF00;'>baseball</li>\\n\" when given 'li' , 'baseball' , :multiline => false , :color => :green" do
    html = HTMLTag.new('li', 'baseball', :multiline => false, :color => :green).to_s.chomp
    expect(html).to match %r{<li\s+style=('|")color:#00FF00;(\1)\s*>baseball</li>}i
  end

  it "generates \"<li style='color:#0000FF;'>baseball</li>\\n\" when given 'li' , 'baseball' , :color => :blue" do
    html = HTMLTag.new('li', 'baseball', :color => :blue).to_s.chomp
    expect(html).to match %r{<li\s+style=('|")color:#0000FF;(\1)\s*>baseball</li>}i
  end

  it "generates \"<p >soccer</p>\\n\" when given 'p' , 'soccer' , :multiline => false" do
    html = HTMLTag.new('p', 'soccer', :multiline => false).to_s.chomp
    expect(html).to match %r{<p\s*>soccer</p>}i
  end

  it "generates \"<p >soccer</p>\\n\" when given 'p' , 'soccer' , Hash.new" do
    html = HTMLTag.new('p', 'soccer', Hash.new).to_s.chomp
    expect(html).to match %r{<p\s*>soccer</p>}i
  end

  it "generates \"<p >soccer</p>\\n\" when given 'p' , 'soccer' , and no hash" do
    html = HTMLTag.new('p', 'soccer').to_s.chomp
    expect(html).to match %r{<p\s*>soccer</p>}i
  end

  it "generates \"<li style='font-family:\"Arial\", \"Verdana\";color:#FF0000;'>baseball</li>\\n\" when given 'li' , 'baseball' , :multiline => false , :color => :red , :font => :sans_serif" do
    regex = %r{<li\s+style=('|")(.*)(\1)\s*>baseball</li>}i
    html  = HTMLTag.new('li', 'baseball', :multiline => false, :color => :red, :font => :sans_serif).to_s.chomp
    expect(html).to match regex
    html =~ regex   # because capture groups aren't _really_ global, and rspec changes scope of execution
    style = $2
    expect(style).to match /font-family:("|')Arial(\1), ("|')Verdana(\3);color:#FF0000;/i
  end

  it 'uses newlines when given multiline' do
    html = HTMLTag.new('p', 'soccer', :multiline => true).to_s.chomp
    expect(html).to match %r{<p\s*>\nsoccer\n</p>}i
  end
end


RSpec.describe 'The example from the explanation' do
  before :each do
    sports = [
      HTMLTag.new('li', 'baseball', :multiline => false, :color => :red,   :font => :serif) ,
      HTMLTag.new('li', 'soccer'  , :multiline => false, :color => :green, :font => :sans_serif) ,
      HTMLTag.new('li', 'football', :multiline => false, :color => :blue,  :font => :monospace) ,
    ]

    ordered_list = HTMLTag.new 'ol', sports.join, :multiline => true

    @lines = ordered_list.to_s.split("\n")

    @regexes = {
      :open     => /<ol\s*>/i ,
      :baseball => {:tag => %r{<li\s+style=('|")(.*?)(\1)>baseball</li>}i, :styles => [/color\s*:\s*#FF0000\s*;/i, /font-family:("?|'?)Times New Roman(\1),\s*("?|'?)Georgia(\3);/   ] },
      :soccer   => {:tag => %r{<li\s+style=('|")(.*?)(\1)>soccer</li>}i,   :styles => [/color\s*:\s*#00FF00\s*;/i, /font-family:("?|'?)Arial(\1),\s*("?|'?)Verdana(\3);/             ] },
      :football => {:tag => %r{<li\s+style=('|")(.*?)(\1)>football</li>}i, :styles => [/color\s*:\s*#0000FF\s*;/i, /font-family:("?|'?)Courier New(\1),\s*("?|'?)Lucida Console(\3);/] },
      :close    => %r(</ol>)i,
    }
  end

  it 'is five lines long' do
    expect(@lines.size).to eq 5
  end

  specify 'the first tag is an ordered list' do
    expect(@lines[0]).to match @regexes[:open]
  end

  specify 'the second tag is the li for baseball' do
    expect(@lines[1]).to match @regexes[:baseball][:tag]
  end

  specify "the baseball li's style matches the expected styles" do
    @lines[1] =~ @regexes[:baseball][:tag]
    style = $2
    @regexes[:baseball][:styles].each { |regex| expect(style).to match regex }
  end


  specify 'the third tag is the li for soccer' do
    expect(@lines[2]).to match @regexes[:soccer][:tag]
  end

  specify 'the third tag matches the expected styles' do
    @lines[2] =~ @regexes[:soccer][:tag]
    style = $2
    @regexes[:soccer][:styles].each { |regex| expect(style).to match regex }
  end

  specify 'the fourth tag is the li for football' do
    expect(@lines[3]).to match @regexes[:football][:tag]
  end

  specify "the fourth tag's style matches the expected styles" do
    @lines[3] =~ @regexes[:football][:tag]
    style = $2
    @regexes[:football][:styles].each { |regex| expect(style).to match regex }
  end

  specify 'the fifth tag closes the ordered list' do
    expect(@lines[4]).to match @regexes[:close]
  end
end
