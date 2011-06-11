require 'date'

class User
  
  attr_accessor :username , :blogs
  
  def initialize(username)
    self.username , self.blogs = username , Array.new
  end
  
  def blogs
    @blogs.sort! { |blog1,blog2| blog2.date <=> blog1.date }
  end
  
  def add_blog(date,text)
    Blog.new date , self , text
  end
  
end



class Blog
  
  attr_accessor :date , :user , :text
  
  def initialize( date , user , text )
    self.date , self.user , self.text = date , user , text
    user.blogs << self
  end
  
  def summary
    text.split[0..9].join(' ')
  end
  
  def display_entry
    puts "#{user.username} #{date}" , text
  end

  def ==(other)
    date == other.date && user == other.user && text == other.text
  end
  
end
