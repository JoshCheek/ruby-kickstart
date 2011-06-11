class HTMLTag
  
  FONTS = { 
    :serif        => '"Times New Roman", "Georgia"'     ,
    :sans_serif   => '"Arial", "Verdana"'               ,
    :monospace    => '"Courier New", "Lucida Console"' 
  }
  
  attr_accessor :name , :innerHTML , :options
  
  # options is a hash tag that allows the user to specify whether they want this tag to span multiple lines
  # example when args are: 'p' , 'hello world' , :multiline => false
  # <p >hello world</p>
  # 
  # example when args are: 'p' , 'hello world' , :multiline => true
  # <p >
  # hello world
  # </p>
  def initialize(name, innerHTML, options={})
    @name , @innerHTML , @options = name , innerHTML , options
  end
  
  def font
    font = options[:font]   # one of :serif , :sans_serif , :monospace, or nil if it doesn't exist
    FONTS[font]             # look up the user defined result in our FONTS hash to get the css
  end

  # if the font is specified, we can return the style
  # if not, we return nil. And nil.to_s is the empty String
  def style
    return nil unless options[:font]
    "style='font-family:#{font}'"
  end
  
  # convert our HTMLTag to a String (in this case, it is represented as HTML)
  def to_s
    # remember, if options[:multiline] doesn't exist, it will return nil, and nil is false
    line_end = if options[:multiline] then "\n" else "" end
    "<#{name} #{style}>#{line_end}"  \
    "#{innerHTML.chomp}#{line_end}"  \
    "</#{name}>\n"
  end
  
end


# let us create a list of sports we like
# they will have no options
sports = [
  HTMLTag.new('li', 'baseball', :multiline => false) ,
  HTMLTag.new('li', 'soccer'                       ) ,  # no multiline here, but the default is false... why is this?
  HTMLTag.new('li', 'football', :multiline => false) ,
]

# join will use the to_s method of each object in the Array to convert it into a string
sports[0].to_s    # => "<li >baseball</li>\n"
sports.join       # => "<li >baseball</li>\n<li >soccer</li>\n<li >football</li>\n"

# let's turn the entire array of list elements into the inner HTML for an ordered list tag
# note that the hash at the end does not have brackets around it, we'll talk about that at the end of the josh.rb notes
ordered_list = HTMLTag.new 'ol' , sports.join , :font => :sans_serif , :multiline => true

# puts will also convert the tag to a string by invoking the to_s method
puts ordered_list
# >> <ol style='font-family:"Arial", "Verdana"'>
# >> <li >baseball</li>
# >> <li >soccer</li>
# >> <li >football</li>
# >> </ol>
