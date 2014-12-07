require_relative 'helper'

# make the date readable for when it gets stuck in output
class Date
  def inspect
    to_s
  end
end


RSpec.describe 'User' do
  it 'has a username' do
    lissa = User.new 'QTSort'
    expect(lissa.username).to eq 'QTSort'
    lissa.username = 'Programmer Superstar'
    expect(lissa.username).to eq 'Programmer Superstar'
  end
end


RSpec.describe 'Blog' do
  it 'has a date, user, and text' do
    date  = Date.parse "2010-05-28"
    lissa = User.new 'QTSort'
    blog  = Blog.new date, lissa, "Sailor Venus is my favourite"
    expect(blog.date).to eq date
    expect(blog.user).to eq lissa
    expect(blog.text).to eq 'Sailor Venus is my favourite'
  end

  it '#summary returns the first ten words of the text' do
    date  = Date.parse "2010-05-28"
    lissa = User.new 'QTSort'
    blog  = Blog.new date, lissa, "one two three four five six seven eight nine ten eleven twelve"
    expect(blog.summary).to    eq "one two three four five six seven eight nine ten"
    expect(blog.text).to       eq "one two three four five six seven eight nine ten eleven twelve"
  end

  specify "#entry returns the username, date, and text" do
    date  = Date.parse '2010-05-28'
    lissa = User.new 'QTSort'
    blog  = Blog.new date, lissa, <<-BLOG_ENTRY.gsub(/^\s+/, '')
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce orci nunc, porta non tristique eu, auctor tincidunt mauris.
      Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vitae nibh sapien. Curabitur
      eget eros bibendum justo congue auctor non at turpis. Aenean feugiat vestibulum mi ac pulvinar. Fusce ut felis justo, in
      porta lectus.
    BLOG_ENTRY
    expect(blog.entry).to eq <<-EXPECTED_OUTPUT.gsub(/^\s+/, '')
      QTSort 2010-05-28
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce orci nunc, porta non tristique eu, auctor tincidunt mauris.
      Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vitae nibh sapien. Curabitur
      eget eros bibendum justo congue auctor non at turpis. Aenean feugiat vestibulum mi ac pulvinar. Fusce ut felis justo, in
      porta lectus.
    EXPECTED_OUTPUT
  end

  it "returns the correct entry, even if the blog changes" do
    date  = Date.parse '2010-05-28'
    lissa = User.new 'QTSort'
    blog  = Blog.new date, lissa, <<-BLOG_ENTRY.gsub(/^\s+/, '')
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce orci nunc, porta non tristique eu, auctor tincidunt mauris.
      Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vitae nibh sapien. Curabitur
      eget eros bibendum justo congue auctor non at turpis. Aenean feugiat vestibulum mi ac pulvinar. Fusce ut felis justo, in
      porta lectus.
    BLOG_ENTRY
    expect(blog.entry).to eq <<-EXPECTED_OUTPUT.gsub(/^\s+/, '')
      QTSort 2010-05-28
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce orci nunc, porta non tristique eu, auctor tincidunt mauris.
      Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vitae nibh sapien. Curabitur
      eget eros bibendum justo congue auctor non at turpis. Aenean feugiat vestibulum mi ac pulvinar. Fusce ut felis justo, in
      porta lectus.
    EXPECTED_OUTPUT
    blog.date = Date.parse '2009-01-02'
    blog.user = User.new 'disloyalist.party'
    blog.text = "From the school of revision, Comes the standard inventor's rule, Books of subtle notation Compositions, all original\n" \
                "I am a pioneer, synthetic engineer, On the brink of discovery, On the eve of historic light, Worked in secret for decades,\n" \
                "All my labor will be lost with time\n"
    expect(blog.entry).to eq <<-EXPECTED_OUTPUT.gsub(/^\s+/, '')
      disloyalist.party 2009-01-02
      From the school of revision, Comes the standard inventor's rule, Books of subtle notation Compositions, all original
      I am a pioneer, synthetic engineer, On the brink of discovery, On the eve of historic light, Worked in secret for decades,
      All my labor will be lost with time
    EXPECTED_OUTPUT
  end

  it 'is equal to another blog, if they have the same user, date, and text' do
    lissa = User.new 'QTSort'
    josh  = User.new 'Josh'

    blog1 = Blog.new(Date.parse("2010-05-28"), lissa, "Sailor Venus is my favourite")
    blog2 = Blog.new(Date.parse("2010-05-28"), lissa, "Sailor Venus is my favourite")
    blog3 = Blog.new(Date.parse("2011-11-11"), lissa, "Sailor Venus is my favourite")
    blog4 = Blog.new(Date.parse("2010-05-28"), josh,  "Sailor Venus is my favourite")
    blog5 = Blog.new(Date.parse("2010-05-28"), lissa, "Sailor Venus is my least favourite")
    expect(blog1).to     eq blog2 # eq uses the == method
    expect(blog1).to_not eq blog3
    expect(blog1).to_not eq blog4
    expect(blog1).to_not eq blog5
  end
end


RSpec.describe 'User' do
  specify 'A new user has no blogs' do
    user = User.new 'QTSort'
    expect(user.blogs).to eq Array.new
  end

  it 'can add blogs' do
    user = User.new 'QTSort'
    user.add_blog(Date.today, "text")
    expect(user.blogs.size).to       eq 1
    expect(user.blogs.first.date).to eq Date.today
    expect(user.blogs.first.text).to eq 'text'
  end

  it 'can retrieve its added blogs' do
    user = User.new 'QTSort'
    blog = user.add_blog(Date.today, "text")
    expect(user.blogs.first).to eq blog
  end

  it 'returns its blogs in order of date' do
    lissa = User.new 'QTSort'
    blog1 = lissa.add_blog Date.parse("2010-05-28"), "Sailor Venus is my favourite"
    blog2 = lissa.add_blog Date.parse("2007-01-02"), "Going dancing!"
    blog3 = lissa.add_blog Date.parse("2006-01-02"), "For the last time, fuck facebook >.<"
    blog4 = lissa.add_blog Date.parse("2010-01-02"), "Got a new job, cuz I'm pretty much the best ^_^"
    expect(lissa.blogs.size).to eq 4
    blog_dates = lissa.blogs.map { |blog| blog.date }
    expect(blog_dates).to eq [Date.parse('2010-05-28'), Date.parse('2010-01-02'), Date.parse('2007-01-02'), Date.parse('2006-01-02')]
    expect(lissa.blogs).to eq [blog1, blog4, blog2, blog3]
  end
end
