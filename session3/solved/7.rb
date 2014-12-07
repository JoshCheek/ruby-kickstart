class HTMLTag
  FONTS = {
    :serif      => '"Times New Roman", "Georgia"',
    :sans_serif => '"Arial", "Verdana"',
    :monospace  => '"Courier New", "Lucida Console"' ,
  }

  COLORS = {
    :red   => '#FF0000',
    :green => '#00FF00',
    :blue  => '#0000FF',
  }

  attr_accessor :name, :innerHTML, :font, :color, :multiline

  # options: :multiline should be true or false
  def initialize(name, innerHTML, options=Hash.new)
    @name, @innerHTML = name, innerHTML
    self.font      = FONTS[options[:font]]
    self.color     = COLORS[options[:color]]
    self.multiline = options.fetch :multiline, false
  end

  def style
    return nil unless font || color
    to_return = "style='"
    to_return << "font-family:#{font};" if font
    to_return << "color:#{color};"      if color
    to_return << "'"
    to_return
  end

  def to_s
    line_end = ""
    line_end = "\n" if multiline # remember, if options[:multiline] doesn't exist, it will return nil, and nil is false
    "<#{name} #{style}>#{line_end}"   \
      "#{innerHTML.chomp}#{line_end}" \
    "</#{name}>\n"
  end
end
