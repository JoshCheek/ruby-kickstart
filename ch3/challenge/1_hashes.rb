# This challenge is based off of problem 1
# modify it such that it also accepts in the hash, a color (whose values are red("#FF0000"), green("#00FF00"), and blue(#0000FF) )
# if the color is set, then it should show up in the style
# It should also not be necessary to pass in the hash, if you don't want to specify options
#
#
# EXAMPLE: 
#
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

class HTMLTag
  
  FONTS = { 
    :serif        => '"Times New Roman", "Georgia"'     ,
    :sans_serif   => '"Arial", "Verdana"'               ,
    :monospace    => '"Courier New", "Lucida Console"' 
  }
  
  COLORS = {
    :red   => '#FF0000' ,
    :green => '#00ff00' ,
    :blue  => '#0000FF'
  }
  
  attr_accessor :name , :innerHTML , :options
  
  # options: will be an empty Hash by default if none is passed
  def initialize(name,innerHTML,options = Hash.new)
    @name , @innerHTML , @options = name , innerHTML , options
  end
  
  def font
    return nil unless options.has_key? :font
    font = options[:font]  #  one of :serif , :sans_serif , or :monospace
    "font-family:#{FONTS[font]};"
  end
  
  def color
    return nil unless options.has_key? :color
    color = options[:color]
    "color:#{COLORS[color]};"
  end

  def style
    return nil unless options[:font] || options[:color]
    "style='#{font}#{color}'"
  end
  
  def to_s
    # remember, if options[:multiline] doesn't exist, it will return nil, and nil is false
    line_end = if options[:multiline] then "\n" else "" end
    "<#{name} #{style}>#{line_end}"  \
    "#{innerHTML.chomp}#{line_end}"  \
    "</#{name}>\n"
  end
  
end
