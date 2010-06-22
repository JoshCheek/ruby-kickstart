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



__END__
redirect '/'
redirect '/posts/1'
redirect 'http://www.google.com'
The redirect actually sends back a Location header to the browser, and the browser makes a followup request to the location indicated. Since the browser makes that followup request, you can redirect to any page, in your application, or another site entirely.
The flow of requests during a redirect is: Browser –> Server (redirect to ’/’) –> Browser (request ’/’) –> Server (result for ’/’)
To force Sinatra to send a different response code, it’s very simple:
redirect '/', 303 # forces the 303 return code
redirect '/', 307 # forces the 307 return code
