#/Users/joekelly/Desktop/Projects/ruby-kickstart/session6/notes/01-web-introduction.rb file content is listed below
###############################################################################

# Every building in America has an address so you can send letters
# to people who live there. In the same way, every computer on the
# internet has an address so you can send data to programs that
# are running there. This address is called an IP address and looks
# like 74.125.91.103

# When you send a letter to a building, there can be many people who
# live there, so you write the apartment number, or the person's
# name on the envelope. In the same way, when you send data to a
# computer, there can be many programs that are running there, so
# you specify which one you want to talk to by providing a port
# number. The port is just an address that programs can reside at,
# on the computer.

# Your web application will use a program called a server to watch
# the port for incoming data. The server will take the data, and
# provide it to your application in a way that your application
# can do something with it.


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session6/notes/02-servers-and-rack.rb file content is listed below
###############################################################################

# Ruby web applications usually use an interface called Rack that
# will present the server's data to our program us in the form of
# a hash table like this:

{
  "REQUEST_METHOD"  => "GET",                # The type of request
  "REQUEST_PATH"    => "/",                  # Where to go on my application
  "REMOTE_ADDR"     => "127.0.0.1",          # This is my IP address
  "SERVER_PORT"     => "3000",               # This is my port
  "SERVER_SOFTWARE" => "Mongrel 1.2.0.pre2", # This is my server
  "HTTP_USER_AGENT" => "Mozilla/5.0 [...]",  # This was the browser I made the request with
  "HTTP_COOKIE"     => "BAh7CU3[...]",       # My cookie: an encrypted string
  # ... and so on ...
}

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session6/notes/03-framework-introduction.rb file content is listed below
###############################################################################

# The server deals with all the internet stuff, and rack gives
# my applications a consistent and simple interface to the server,
# my applications just have to figure out what they want to do.

# But this isn't very much infrastructure, I have to still do all
# the work of parsing that big hash table and figuring out what it
# means for my application.

# To make this simpler, we use frameworks. Frameworks give us the tools
# (as gems) that we need to do things that make sense on the internet.
# They give us an interface so we can think about the stuff that
# matters in a way that is idiomatic for the web.

# Ruby on Rails is the most popular Ruby framework, it goes so far
# as to specify how your applications should be laid out, what
# abstractions you should use, how you should name your classes and
# variables.

# Sinatra is a much much simpler framework, it really gives you a
# minimal interface to match incoming requests and return a response.
# It also handles all the templating for you (taking data and
# making a web page out of it). The http://ruby-kickstart.com code
# is written in Sinatra. So is my own webpage, http://joshcheek.com


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session6/notes/04-sinatra.rb file content is listed below
###############################################################################

# There are different types of web requests. The kind of web request
# you make when you go to a webpage in your browser is called a
# "GET request". Another common type is a "POST request" which is
# what many forms use. You can think as a tag that you add to your
# request that gives the server an idea of what you want to do.

# A Sinatra application is composed of a series of routes that match
# these requests. They are associated with blocks of code that will
# be evaluated when a user goes to that route. Whatever the block
# returns will be sent back to the user as the response.

require 'sinatra'

get '/' do
  # This is HTML, the language we use to describe the data on our page.
  "<a href='/form'>Fill out the Form</a>"
end

get "/form" do
  "<form action='/form' method='post'>
    <input type='text' name='the_data'>
    <input type='submit'>
  </form>"
end

post "/form" do
  "You submitted #{params[:the_data].inspect}"
end


# That is the core of Sinatra. You can run this file:
# $ ruby 04-sinatra.rb
# and then go to "http://localhost:4567/form"
# localhost is a shortcut for the IP of your current computer,
# 4567 is Sinatra's default port, and /form is the route we
# matched from up above.


################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session6/notes/05-erb.rb file content is listed below
###############################################################################

# Web sites use a language called HTML to organize what a site
# should look like on a page (I'm not going to cover HTML, if you
# want to learn about it, consider http://htmldog.com).

# The best way to write HTML that needs to be dynamic is to use a
# templating language like ERB, this lets us embed our Ruby right
# into the html.
shopping_cart = ['lamp', 'desk', 'pencils']
template = "
<ul>
  <% shopping_cart.each do |item| %>
    <li><%= item %></li>
  <% end %>
</ul>
"

# For lines where you don't want to keep the output, like the line
# that iterates over the shopping cart, you put your Ruby inside <% %>
# tags. For lines where you want to embed the output, put your code
# inside of <%= %> tags.

require 'erb'
puts ERB.new(template).result
# >>
# >> <ul>
# >>
# >>     <li>lamp</li>
# >>
# >>     <li>desk</li>
# >>
# >>     <li>pencils</li>
# >>
# >> </ul>

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session6/notes/06-sinatra-views-layouts-params-and-variables/main.rb file content is listed below
###############################################################################

require 'sinatra'

# VIEWS:
# Sinatra makes using ERB simpler for you. It will look in a directory
# called views, for files named after the view you tell it you want.
#
# By default, it will also look for a file views/layout.erb, which it
# will render content into.

get '/' do
  erb :home_page # tells Sinatra to render views/home_page.erb
end



# PARAMS:
# The contents of the form we submitted on the home_page comes in
# in a hash Sinatra makes available to us through the params method.
# Since the form was named cart_items, that is the key its contents
# are available through.

post '/cart' do
  # Each time someone makes an HTTP request, we get a new Sinatra
  # object to handle that request. So if we use instance variables
  # then they will be available everywhere, including inside our views
  @cart_items = params[:cart_items].split
  erb :cart
end

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session6/notes/07-sinatra-routes.rb file content is listed below
###############################################################################

# You can also match variables in routes. Precede them with a colon
# Sinatra will use regular expressions to find the variable and put it
# in the params hash under the name you have specified.

require 'sinatra'
get '/hello/:first_name' do
  "Hello, #{params[:first_name]}, glad you could join us."
end

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session6/notes/08-rack-and-reloading/main.rb file content is listed below
###############################################################################

require 'sinatra'

get "/" do
  "Hello, world"
end

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session6/notes/09-static-files-and-bundler/main.rb file content is listed below
###############################################################################

require 'sinatra'

# When you want to serve up static pages (things that
# don't change, that you aren't generating), you can
# put them in a directory named public. So in the code
# below, The image at /dependencies.png is located on
# our file system at public/dependencies.png, and
# Sinatra will look there and find it.


get '/' do
  # We'll use markdown http://daringfireball.net/projects/markdown/
  # to render this content. Sinatra uses the rdiscount
  # gem to do that by default, so we have it in our Gemfile.
  markdown "
  Example graph:

  ![Dependencies Graph](/dependencies.png)'

  A depends on C1, but B can do either C1 or C2,
  so obviously the right gem to load is C1.
  But if B gets loaded before A, then C2 will get
  loaded since it's the newest, then when we load A,
  it will blow up :(.

  We need to introduce something before we require
  either A or C. It can look at the dependencies,
  figure out what we figured out above, and make
  sure that C1 gets required rather than C2.

  That is what Bundler does. Get it with
  `gem install bundler`. Then make a Gemfile in your
  project's root directory. On the
  [gem's page](https://rubygems.org/gems/sinatra),
  it will tell you what to put into Bundler to make it
  work right, in our case, `gem \"sinatra\", \"~> 1.2.6\"`.

  Then, when we've listed (or updated) our gems, we run
  `$ bundle install`, and Bundler will resolve all of
  our dependencies and generate a Gemfile.lock which
  contains the exact gem versions we are using. If it
  needs to install any of the gems, it will do that too.
  This is what Heroku (who will host our application) uses
  to install your gems on its server.

  So now we know what gems we want to use, we just have
  to make sure and actually use them. This means that
  Bundler must be involved from the very beginning. Instead
  of saying `$ rackup config.ru`, we run
  `$ bundle exec rackup config.ru`. This loads up Bundler,
  which finds our Gemfile.lock and makes sure the right
  gems get required.

  You probably won't have to worry about dependencies
  on a small application, so we're not going to go deeply
  into how Bundler works and how to work with it. If you
  need it, [the site](http://gembundler.com/) is really
  great.
  "
end

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session6/notes/10-git/notes.rb file content is listed below
###############################################################################

# Git is a source code management tool. It will keep track of all
# your changes. It will also let you interact with remote code.
# All of this code, for example, is maintained by git, and I can
# put it on GitHub so that everyone else can download it or even
# make changes and send them to me.

# In the same way my code is on GitHub, my code is also on Heroku.
# Heroku doesn't let anyone else see it like GitHub does, but
# when I use git to push my code to Heroku, my web application
# will automatically update.


# Lets initialize a new git repo in this directory with `$ git init`.

# We want to commit the contents into our git repository. So
# we add them to the staging area with `$ git add .` (remember
# the dot stands for the current directory) And then commit
# with `$ git commit "initial commit"`.


# Hooray, now our code is being managed by git. Lets make a
# change. You can see the change with `$ git status`.

# Go ahead and add it to the source code repository again.

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session6/notes/11-heroku-example/notes.rb file content is listed below
###############################################################################

# YOU WILL NEED TO WATCH THE VIDEO TO SEE THIS ONE DONE
# -----------------------------------------------------

# Okay, lets make a Sinatra application and put it on Heroku.
# It will be a username generator. You will go to
# thesite.com/lastname/firstname and it will generate a username
# for you in the form of first initial of first name, first five
# characters of last name. So thesite.com/Cheek/Josh should
# display "Your username is jcheek"

# Go get an account at heroku.com

# We will do this live:
#   put under source control
#   Create the Gemfile
#   Add RSpec and Sinatra to the Gemfile
#   install the gems
#   check our specs to see if we are passing:
#     $ bundle exec rspec spec --colour --fail-fast
#   Write the Sinatra app we have specified
#   add rackup
#   show that it works in the browser
#   make sure everything is committed
#   create our Heroku app `$ heroku create`
#     The first time you do this, you'll have to authenticate yourself
#     I won't because I've done it before
#     Heroku will add itself as a remote repository to your git repo
#   Push the repo to Heroku with `$ git push heroku master`
#   Now open the site with `$ heroku open`

################################## -- END -- ##################################



#/Users/joekelly/Desktop/Projects/ruby-kickstart/session6/notes/11-heroku-example/spec/username_spec.rb file content is listed below
###############################################################################

require File.dirname(__FILE__) + '/../main'
require 'rack/test'

set :environment, :test

RSpec.describe 'The HelloWorld App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context 'get "/Cheek/Joshua"' do
    before  { get '/Cheek/Joshua' }
    specify { expect(last_response).to be_ok }
    specify { expect(last_response.body).to include "Joshua Cheek's username is jcheek" }
  end

  context 'get "/Cheek/Joshua/Jay"' do
    before  { get '/Cheek/Joshua/Jay' }
    specify { expect(last_response).to be_ok }
    specify { expect(last_response.body).to include "Joshua Jay Cheek's username is jjcheek" }
  end

  context 'get "/Matsumoto/Yukihiro"' do
    before  { get '/Matsumoto/Yukihiro' }
    specify { expect(last_response).to be_ok }
    specify { expect(last_response.body).to include "Yukihiro Matsumoto's username is ymatsu" }
  end
end

################################## -- END -- ##################################



