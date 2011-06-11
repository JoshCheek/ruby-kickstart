describe 'HTMLTag' do
  
  it "should generate \"<li style='color:#FF0000;'>baseball</li>\\n\" when given 'li' , 'baseball' , :multiline => false , :color => :red" do
    HTMLTag.new( 'li' , 'baseball' , :multiline => false , :color => :red ).to_s.chomp.should =~ %r{<li\s+style=('|")color:#FF0000;(\1)\s*>baseball</li>}i
  end
  
  it "should generate \"<li style='color:#00FF00;'>baseball</li>\\n\" when given 'li' , 'baseball' , :multiline => false , :color => :green" do
    HTMLTag.new( 'li' , 'baseball' , :multiline => false , :color => :green ).to_s.chomp.should =~ %r{<li\s+style=('|")color:#00FF00;(\1)\s*>baseball</li>}i
  end
  
  it "should generate \"<li style='color:#0000FF;'>baseball</li>\\n\" when given 'li' , 'baseball' , :color => :blue" do
    HTMLTag.new( 'li' , 'baseball' , :color => :blue ).to_s.chomp.should =~ %r{<li\s+style=('|")color:#0000FF;(\1)\s*>baseball</li>}i
  end
  
  it "should generate \"<p >soccer</p>\\n\" when given 'p' , 'soccer' , :multiline => false" do
    HTMLTag.new( 'p' , 'soccer' , :multiline => false ).to_s.chomp.should =~ %r{<p\s*>soccer</p>}i
  end

  it "should generate \"<p >soccer</p>\\n\" when given 'p' , 'soccer' , Hash.new" do
    HTMLTag.new( 'p' , 'soccer' , Hash.new ).to_s.chomp.should =~ %r{<p\s*>soccer</p>}i
  end

  it "should generate \"<p >soccer</p>\\n\" when given 'p' , 'soccer' , and no hash" do
    HTMLTag.new( 'p' , 'soccer' ).to_s.chomp.should =~ %r{<p\s*>soccer</p>}i
  end
  
  it "should generate \"<li style='font-family:\"Arial\", \"Verdana\";color:#FF0000;'>baseball</li>\\n\" when given 'li' , 'baseball' , :multiline => false , :color => :red , :font => :sans_serif" do
    regex = %r{<li\s+style=('|")(.*)(\1)\s*>baseball</li>}i
    html  = HTMLTag.new( 'li' , 'baseball' , :multiline => false , :color => :red , :font => :sans_serif ).to_s.chomp
    html.should =~ regex
    html =~ regex   # because capture groups aren't _really_ global, and rspec changes scope of execution
    style = $2
    style.should =~ /font-family:("|')Arial(\1), ("|')Verdana(\3);color:#FF0000;/i
  end
  
  it 'multiline switch should work' do
    HTMLTag.new( 'p' , 'soccer' , :multiline => true ).to_s.chomp.should =~ %r{<p\s*>\nsoccer\n</p>}i
  end

end





describe 'The example from the explanation' do
    
  before :each do
    sports = [
      HTMLTag.new( 'li' , 'baseball' , :multiline => false , :color => :red   , :font => :serif      ) ,
      HTMLTag.new( 'li' , 'soccer'   , :multiline => false , :color => :green , :font => :sans_serif ) ,
      HTMLTag.new( 'li' , 'football' , :multiline => false , :color => :blue  , :font => :monospace  ) ,
    ]
  
    ordered_list = HTMLTag.new 'ol' , sports.join , :multiline => true
  
    @lines = ordered_list.to_s.split("\n")

    @regexes = {
      :open     => /<ol\s*>/i ,  
      :baseball => { :tag => %r{<li\s+style=('|")(.*?)(\1)>baseball</li>}i , :styles => [/color\s*:\s*#FF0000\s*;/i , /font-family:("?|'?)Times New Roman(\1),\s*("?|'?)Georgia(\3);/     ] },
      :soccer   => { :tag => %r{<li\s+style=('|")(.*?)(\1)>soccer</li>}i   , :styles => [/color\s*:\s*#00FF00\s*;/i , /font-family:("?|'?)Arial(\1),\s*("?|'?)Verdana(\3);/               ] },
      :football => { :tag => %r{<li\s+style=('|")(.*?)(\1)>football</li>}i , :styles => [/color\s*:\s*#0000FF\s*;/i , /font-family:("?|'?)Courier New(\1),\s*("?|'?)Lucida Console(\3);/  ] },
      :close    => %r(</ol>)i,
    }
  end
    
  it 'should result in five lines' do
    @lines.size.should == 5
  end
  
  its 'first tag should be ordered list' do
    @lines[0].should =~ @regexes[:open]
  end

  its 'second line should be the li for baseball' do
    @lines[1].should  =~  @regexes[:baseball][:tag]
  end
  
  its "second line's style should match the expected styles" do
    @lines[1] =~ @regexes[:baseball][:tag]
    style = $2
    @regexes[:baseball][:styles].each { |regex| style.should =~ regex }
  end
  
  
  its 'third line should be the li for soccer' do  
    @lines[2].should  =~  @regexes[:soccer][:tag]
  end
  
  its 'third line should match the expected styles' do
    @lines[2] =~ @regexes[:soccer][:tag]
    style = $2
    @regexes[:soccer][:styles].each { |regex| style.should =~ regex }
  end
  
  its 'fourth line should be the li for football' do
    @lines[3].should  =~  @regexes[:football][:tag]    
  end
  
  its 'fourth lines style should match the expected styles' do
    @lines[3] =~ @regexes[:football][:tag]
    style = $2
    @regexes[:football][:styles].each { |regex| style.should =~ regex }
  end
    
  its 'fifth line should close the ordered list' do
    @lines[4].should  =~  @regexes[:close]
  end  

end