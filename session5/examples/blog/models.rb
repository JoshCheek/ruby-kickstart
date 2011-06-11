# names should be singular
class BlogPost
  include DataMapper::Resource
  property :id,         Serial   # An auto-increment integer key
  property :title,      String   # A varchar type string, for short strings
  property :body,       Text     # A text block, for longer string data.
  property :created_at, DateTime # A DateTime, for any date you might like.
  
  validates_presence_of :title , :body
  
  has n , :comments
  
  def url
    to_return = title.dup
    to_return.gsub!(/[^a-z0-9_]+/i, '-')  # Turn unwanted chars into dashes
    to_return.gsub!(/-{2,}/, '-')         # No more than one dash in a row
    to_return.gsub!(/^-|-$/i, '')         # Remove leading/trailing separator.
    "/#{id}-#{to_return.downcase}"
  end
end



class Comment
  include DataMapper::Resource
  property :id,         Serial
  property :posted_by,  String
  property :email,      String
  property :homepage,   String
  property :body,       Text
  belongs_to :blog_post
end




