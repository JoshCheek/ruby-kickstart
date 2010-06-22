# a good book http://sinatra-book.gittr.com/       (note that most of it appears to be good, but some of it appears to be outdated)
# docs http://www.sinatrarb.com/documentation

require 'rubygems'
require 'sinatra/base'
include Sinatra::Delegator


# =====  To Create a Sinatra App  =====
# Male a simple text file that ends with .rb
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
    compile '/actors/brad-pitt'               # => [/^\/actors\/brad-pitt$/, []]
    
    # Routes with variables - notice it replaces the variable name with a capture group, 
    # And it keeps track of the variable name for assigning the match in the params hash
    compile '/actors/:firstname-:lastname'    # => [/^\/actors\/([^\/?&#]+)-([^\/?&#]+)$/, ["firstname", "lastname"]]
    compile '/it/is/:time/in/:location'       # => [/^\/it\/is\/([^\/?&#]+)\/in\/([^\/?&#]+)$/, ["time", "location"]]
    
    # The splat will greedily eat up as much as it can, and get placed in the params hash under the name 'splat'
    compile '/the-path-is/*'                  # => [/^\/the-path-is\/(.*?)$/, ["splat"]]
  end
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


# ===========================================
# =====  Things You Can Do In The Block =====
# ===========================================

# =====  Redirect  =====
# You can send an HTTP redirect with the redirect method
get '/invalid' do
  redirect '/valid'
end

get '/ruby' do
  redirect 'http://www.ruby-lang.org/'
end


# =====  Cookie Sessions  =====
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

