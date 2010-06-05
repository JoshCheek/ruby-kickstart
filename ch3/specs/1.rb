describe 'HTMLTag' do
  
  it "should generate \"<li style='color:#FF0000;'>baseball</li>\\n\" when given 'li' , 'baseball' , :multiline => false , :color => :red" do
    HTMLTag.new( 'li' , 'baseball' , :multiline => false , :color => :red ).to_s.chomp.should =~ %r{<li\s+style=('|")color:#FF0000;(\1)\s*>baseball</li>}
  end
  
  it "should generate \"<li style='color:#00FF00;'>baseball</li>\\n\" when given 'li' , 'baseball' , :multiline => false , :color => :green" do
    HTMLTag.new( 'li' , 'baseball' , :multiline => false , :color => :green ).to_s.chomp.should =~ %r{<li\s+style=('|")color:#00FF00;(\1)\s*>baseball</li>}
  end
  
  it "should generate \"<li style='color:#0000FF;'>baseball</li>\\n\" when given 'li' , 'baseball' , :color => :blue" do
    HTMLTag.new( 'li' , 'baseball' , :color => :blue ).to_s.chomp.should =~ %r{<li\s+style=('|")color:#0000FF;(\1)\s*>baseball</li>}
  end
  
  it "should generate \"<p >soccer</p>\\n\" when given 'p' , 'soccer' , :multiline => false" do
    HTMLTag.new( 'p' , 'soccer' , :multiline => false ).to_s.chomp.should =~ %r{<p\s*>soccer</p>}
  end

  it "should generate \"<p >soccer</p>\\n\" when given 'p' , 'soccer' , Hash.new" do
    HTMLTag.new( 'p' , 'soccer' , Hash.new ).to_s.chomp.should =~ %r{<p\s*>soccer</p>}
  end

  it "should generate \"<p >soccer</p>\\n\" when given 'p' , 'soccer' , and no hash" do
    HTMLTag.new( 'p' , 'soccer' ).to_s.chomp.should =~ %r{<p\s*>soccer</p>}
  end
  
  it "should generate \"<li style='font-family:\"Arial\", \"Verdana\";color:#FF0000;'>baseball</li>\\n\" when given 'li' , 'baseball' , :multiline => false , :color => :red , :font => :sans_serif" do
    regex = %r{<li\s+style=('|")(.*)(\1)\s*>baseball</li>}
    html  = HTMLTag.new( 'li' , 'baseball' , :multiline => false , :color => :red , :font => :sans_serif ).to_s.chomp
    html.should =~ regex
    html =~ regex   # because capture groups aren't _really_ global, and rspec changes scope of execution
    style = $2
    style.should =~ /font-family:("|')Arial(\1), ("|')Verdana(\3);color:#FF0000;/
  end
  
  raise "need to write more stupid specs"
  
  # html = HTMLTag.new 'p' , 'Hello World' , :multiline => false , :color => :red
  # html.to_s     # => <p style="color:#FF0000">Hello World</p>
  #
  # sports = [
  #   HTMLTag.new( 'li' , 'baseball' , :multiline => false , :color => :red   , :font => :serif      ) ,
  #   HTMLTag.new( 'li' , 'soccer'   , :multiline => false , :color => :green , :font => :sans_serif ) ,
  #   HTMLTag.new( 'li' , 'football' , :multiline => false , :color => :blue  , :font => :monospace  ) ,
  # ]
  # 
  # ordered_list = HTMLTag.new 'ol' , sports.join , :multiline => true
  # 
  # puts ordered_list        # => (as output)
  #                            <ol >
  #                            <li style='color:#FF0000;font-family:"Times New Roman", "Georgia"'>baseball</li>
  #                            <li style='color:#00FF00;font-family:"Arial", "Verdana"'>soccer</li>
  #                            <li style='color:#0000FF;font-family:"Courier New", "Lucida Console"'>football</li>
  #                            </ol>
end