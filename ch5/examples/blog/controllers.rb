
get '/' do
  @page_title = 'Recent Posts'
  @posts = BlogPost.all :limit => 5 , :order => [:created_at.desc]
  erb :index
end

get '/new' do
  protected!
  @page_title = "New Blog"
  @post = BlogPost.new
  erb :new
end

post '/create' do
  protected!
  @post = BlogPost.new params[:blog_post]
  if @post.save
    redirect @post.url
  else
    @page_title = "New Blog"
    erb :new
  end
end

# will also match /:id-:title
get '/:id' do
  @comment     =  Comment.new
  @post        =  BlogPost.get params[:id].to_i
  @page_title  =  @post.title
  erb :show
end



post '/comments/create' do
  @comment = Comment.new params[:comment]
  if @comment.save
    redirect @comment.blog_post.url
  else
    @page_title = @post.title
    @post = BlogPost.get params[:comment]
    erb :show
  end
  erb :show
end

