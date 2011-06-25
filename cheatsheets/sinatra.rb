# a good book http://sinatra-book.gittr.com/       (note that most of it appears to be good, but some of it appears to be outdated)
# docs http://railsapi.com/doc/sinatra-v1.1.2/     (I really like example based docs like this one -- almost feels like another cheetsheat)

require 'rubygems'
require 'sinatra/base'
extend Sinatra::Delegator


# =====  To Create a Sinatra App  =====
# Make a simple text file that ends with .rb
# Require rubygems and sinatra
# Define your http methods, their routes and responses
# Run it like any Ruby file (if shotgun works on your computer, try with that)


# =====  HTTP Methods  =====
# get , post , put , delete
# To define one, simply type which one it is (correlates to a method invocation)
# Then pass it the route you wish to match, and the block that defines the code to execute when that route is matched

# Now when someone makes a get request to 'yourapp.com/home' it will return 'hello world'
get '/home' do
  'hello world!'
end


# =====  Routes  =====
# Routes are compiled into regular expressions.
# You can place named variables in the route by listing them like symbols
# '/hello/:name' will take the name out of the url and make it available in the params hash
# Routes are relative to the path your app is mounted on (probably the root of your application, ie localhost)

# what do the routes look like when they get compiled?
module Sinatra
  class Base
    # Pure routes
    compile '/'                               # => [/^\/$/, []]
    compile '/actors/brad-pitt'               # => [/^\/actors\/brad(?:\-|%2D)pitt$/, []]
    
    # Routes with variables - notice it replaces the variable name with a capture group, 
    # And it keeps track of the variable name for assigning the match in the params hash
    compile '/actors/:firstname-:lastname'    # => [/^\/actors\/([^\/?#]+)(?:\-|%2D)([^\/?#]+)$/, ["firstname", "lastname"]]
    compile '/it/is/:time/in/:location'       # => [/^\/it\/is\/([^\/?#]+)\/in\/([^\/?#]+)$/, ["time", "location"]]
    
    # The splat will greedily eat up as much as it can, and get placed in the params hash under the name 'splat'
    compile '/the-path-is/*'                  # => [/^\/the(?:\-|%2D)path(?:\-|%2D)is\/(.*?)$/, ["splat"]]
  end
end

# If you want, you can even create your own regexes for the routes
# Then, instead of naming them after the symbol given in the route, it will be passed into the block
get %r{/hello/([\w]+)} do |firstname|
  "Hello, #{firstname}!"
end



# =====  The Params Hash  =====
# You can access the params hash by simply calling the params method, which returns the hash.
# The hash is populated with the parameters passed to your program
# They may come from matching the route you gave
# They may be passed at the end of a route
# They may be submitted with form data
actor_acknowledgment = lambda do 
  firstname  =  params[:firstname].capitalize
  lastname   =  params[:lastname].capitalize
  "You are looking for information about #{firstname} #{lastname}!"
end

# Each of the following url and method pairs will return "You are looking for information about Brad Pitt"
# When you go to them in your browser (the last one is done with curl -- sry Windows guys, didn't know how else to show it)

# http://localhost:4567/actors?lastname=pitt&firstname=brad
# http://localhost:4567/actors?firstname=brad&lastname=pitt
get '/actors' , &actor_acknowledgment

# http://localhost:4567/actors/brad-pitt
# (probably not a great choice since real people can have hyphens in their name :P)
get '/actors/:firstname-:lastname' , &actor_acknowledgment

# http://localhost:4567/actors/brad/pitt
get '/actors/:firstname/:lastname' , &actor_acknowledgment

# curl -d 'firstname=brad&lastname=pitt' http://localhost:4567/actors
# Notice in this case, that firstname and lastname will be passed invisibly ;)
post '/actors' , &actor_acknowledgment


# =====  The Block  =====
# When defining how to respond to a request, you submit the http method, the route, and the block
# The block is what will be executed when the given http method 
# Your params hash will be set and available, and any parameters that were captured will be in there
# Whatever your block returns is what will be displayed to the user


# -----  Redirect  -----
# You can send an HTTP redirect with the redirect method
get '/invalid' do
  redirect '/valid'
end

get '/ruby' do
  redirect 'http://www.ruby-lang.org/'
end


# -----  Cookie Sessions  -----
# Sessions are a way that you can remember a user between HTTP requests (remember, HTTP is inherently stateless)
# The easiest way is to use cookies. Cookies are very small (<4kb) text files that sit on the client's computer
# Also because they are stored on the client's computer, they can be edited by the client, so be careful what you put in there

# To use cookies for sessions, you need to specify so outside the block (ie at the top of your file)
set :sessions, true

# Sessions are implemented with a simple hash
get '/' do
  session["thing"] ||= 0
  session["thing"] += 1
  "Thing is now: #{session["thing"]}"
end


# =====  Before Filters  =====
# Remember challenge 5:2 where my boss was using before filters to set @body_class? Sinatra has something similar. 
# You can specify a block of code to be run before each request. Instance variables are visible, and it can modify the environment

# for example, with the given get request, if we went to '/rock' in our browser, it would work. But if we went to '/rock/' it would not
# because it would no longer match the regular expression generated by the path
# but we could make a before filter that modifies the path to always remove any trailing slashes
before { request.path_info.gsub! /\/$/ , '' } # !> ambiguous first argument; put parentheses or even spaces
get( '/rock' ){ 'roll' }


# =====  Views  =====
# As your Sinatra applications become more complex, creating Strings in your blocks will become britle, obtrusive
# You can add views to a data section within the same file (you'll have to look that up on your own if you want to try it)
# You can also place them into their own files in a subdirectory called 'views'
# then if you want to call it from your sinatra block, you just call the method named after the templating language,
# and pass in the name of your template

get '/' do
  @people = %w(bill barry sally sue jerry quinn)
  erb :roster # I return a String, so still need last line
end

# -----  File: views/roster.erb  -----
# <h3>Roster:</h3>
# <ul>
#   <% @people.each do |person| %>
#     <li>
#       <%= person %>
#     </li>
#   <% end %>
# <ul>
  

# =====  Use A Layout  =====
# Want to give your code a layout that each result is dropped into?
# Just create a file views/layout.erb
# Sinatra will know to use erb to render it b/c of your extension
# Like with blocks, call yield when you want the content to be included

# -----  File: views/layout.erb  -----
# <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
# <html lang='en' xml:lang='en' xmlns='http://www.w3.org/1999/xhtml'>
#   <head>
#     <title>My Awesome App!</title>
#     <meta content='text/html;charset=utf-8' http-equiv='Content-Type' />
#   </head>
#   <body>
#     <%= yield %>
#   </body>
# </html>


# what if you don't want to use the layout?
get '/roster' do
  @roster = %w(amy bill george sally)
  erb :roster , :layout => false
end


# =====  Other Fun Stuff  =====

# Respond to routes that don't exist
not_found do
  'This is nowhere to be found'
end

# configure is a block run once at startup
configure do
  # typically config info goes here, like how to find your database
end

# you can also configure based on environment
configure :development  do end
configure :production   do end
configure :test         do end

