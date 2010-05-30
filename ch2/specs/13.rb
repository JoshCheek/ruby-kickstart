require File.join( File.dirname(__FILE__) , 'helper' )

# make the date readable for when it gets stuck in output
class Date
  def inspect
    to_s
  end
end


describe 'date' do
  it 'should be included' do
    the_classes = Module.constants.map { |c| c.to_s }.grep('Date')
    the_classes.first.should == 'Date'
    the_classes.size.should == 1
    Date.class.should == Class
  end
end

describe 'user' do
  it 'should be a class called User' do
    the_classes = Module.constants.map { |c| c.to_s }.grep('User')
    the_classes.first.should == 'User'
    the_classes.size.should == 1
    User.class.should == Class
  end
  
  it 'should receive the username as a parameter' do
    lissa = User.new 'QTSort'
    lissa.username.should == 'QTSort'
  end
  
  it 'should be able to set the username' do
    user = User.new('josh')
    user.username = 'kevin'
    user.username.should == 'kevin'
  end
end


describe 'blog' do
  it 'should be a class called Blog' do
    the_classes = Module.constants.map { |c| c.to_s }.grep('Blog')
    the_classes.first.should == 'Blog'
    the_classes.size.should == 1
    Blog.class.should == Class 
  end
  
  it 'should initialize with date, user , and text, and have setters for each' do
    date , lissa = Date.parse("2010-05-28") , User.new('QTSort')
    blog = Blog.new date , lissa , "Sailor Venus is my favourite"
    blog.date.should == date
    blog.user.should == lissa
    blog.text.should == 'Sailor Venus is my favourite'
  end
  
  it 'should have a method called summary, which prints out the first ten words of the text' do
    date , lissa = Date.parse("2010-05-28") , User.new('QTSort')
    blog = Blog.new date , lissa , "one two three four five six seven eight nine ten eleven twelve"
    blog.summary.should == "one two three four five six seven eight nine ten"
    blog.text.should    == "one two three four five six seven eight nine ten eleven twelve"
  end
  
  it "should have a method called display_entry that prints out the user's username and the date, and on the next line prints out the entry" do
    date , lissa = Date.parse('2010-05-28') , User.new('QTSort')
    blog = Blog.new date , lissa , <<-BLOG_ENTRY.gsub(/^\s+/,'')
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce orci nunc, porta non tristique eu, auctor tincidunt mauris. 
      Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vitae nibh sapien. Curabitur 
      eget eros bibendum justo congue auctor non at turpis. Aenean feugiat vestibulum mi ac pulvinar. Fusce ut felis justo, in 
      porta lectus.
    BLOG_ENTRY
    input_output { blog.display_entry }.chomp.should == <<-EXPECTED_OUTPUT.gsub(/^\s+/,'').chomp
      QTSort 2010-05-28
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce orci nunc, porta non tristique eu, auctor tincidunt mauris. 
      Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vitae nibh sapien. Curabitur 
      eget eros bibendum justo congue auctor non at turpis. Aenean feugiat vestibulum mi ac pulvinar. Fusce ut felis justo, in 
      porta lectus.
    EXPECTED_OUTPUT
  end  
  
  it "should display the correct output even if the data changes" do
    date , lissa = Date.parse('2010-05-28') , User.new('QTSort')
    blog = Blog.new date , lissa , <<-BLOG_ENTRY.gsub(/^\s+/,'')
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce orci nunc, porta non tristique eu, auctor tincidunt mauris. 
      Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vitae nibh sapien. Curabitur 
      eget eros bibendum justo congue auctor non at turpis. Aenean feugiat vestibulum mi ac pulvinar. Fusce ut felis justo, in 
      porta lectus.
    BLOG_ENTRY
    input_output { blog.display_entry }.chomp.should == <<-EXPECTED_OUTPUT.gsub(/^\s+/,'').chomp
      QTSort 2010-05-28
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce orci nunc, porta non tristique eu, auctor tincidunt mauris. 
      Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vitae nibh sapien. Curabitur 
      eget eros bibendum justo congue auctor non at turpis. Aenean feugiat vestibulum mi ac pulvinar. Fusce ut felis justo, in 
      porta lectus.
    EXPECTED_OUTPUT
    blog.date = Date.parse('2009-01-02')
    blog.user = User.new 'disloyalist.party'
    blog.text = "From the school of revision, Comes the standard inventor's rule, Books of subtle notation Compositions, all original\n" \
                 "I am a pioneer, synthetic engineer, On the brink of discovery, On the eve of historic light, Worked in secret for decades,\n" \
                 "All my labor will be lost with time"
    input_output { blog.display_entry }.chomp.should == <<-EXPECTED_OUTPUT.gsub(/^\s+/,'').chomp
      disloyalist.party 2009-01-02
      From the school of revision, Comes the standard inventor's rule, Books of subtle notation Compositions, all original
      I am a pioneer, synthetic engineer, On the brink of discovery, On the eve of historic light, Worked in secret for decades,
      All my labor will be lost with time
    EXPECTED_OUTPUT
  end
  it 'should be equal to another blog, using the == method, if they have the same user, the same date, and the same text' do
    lissa = User.new 'QTSort'
    blog1 = Blog.new Date.parse("2010-05-28") , lissa , "Sailor Venus is my favourite"
    blog2 = Blog.new Date.parse("2010-05-28") , lissa , "Sailor Venus is my favourite"
    blog1.should == blog2
  end
end


describe 'user' do
  it 'a user just initialized should have no blogs' do
    user = User.new 'QTSort'
    user.blogs.should == Array.new
  end
  it 'should be able to add a blog to its list of blogs, using add_blog' do
    user = User.new 'QTSort'
    user.add_blog Date.today , "text"
    user.blogs.size.should == 1
    user.blogs.first.date.should == Date.today
    user.blogs.first.text.should == 'text'
  end
  it 'should return the blog it creates from the add_blog method' do
    user = User.new 'QTSort'
    blog = user.add_blog Date.today , "text"
    blog.should == user.blogs.first
  end
end


describe 'blog' do
  it "should show up in its user's list of blogs" do
    lissa = User.new 'QTSort'
    blog = Blog.new Date.today , lissa , "Sailor Venus is my favourite"
    lissa.blogs.include?(blog).should == true
  end
  it 'should return its blogs in order of date' do
    lissa = User.new 'QTSort'
    blog1 = lissa.add_blog Date.parse("2010-05-28") , "Sailor Venus is my favourite"
    blog2 = Blog.new       Date.parse("2007-01-02") , lissa , "Going dancing!"                                 
    blog3 = Blog.new       Date.parse("2006-01-02") , lissa , "For the last time, fuck facebook >.<"           
    blog4 = Blog.new       Date.parse("2010-01-02") , lissa , "Got a new job, cuz I'm pretty much the best ^_^"
    lissa.blogs.size.should == 4
    lissa.blogs.map { |blog| blog.date }.should == %w(2010-05-28 2010-01-02 2007-01-02 2006-01-02).map { |date| Date.parse date }
    lissa.blogs.should == [ blog1 , blog4 , blog2 , blog3 ]
  end
end