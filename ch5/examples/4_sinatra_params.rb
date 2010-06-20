require 'rubygems'
require 'sinatra'


# next week, we'll cover how to not have to do silly things like generate HTML in strings in methods
def multiline(*lines)
  '<p>' << lines.join('<br />' ) << '</p>'
end


def greet(firstname)
  multiline   "Hello, #{ firstname.capitalize }, a pleasure to meet you!" , 
              '<a href="/">Click Here</a> to return home.'
end



# at the root of the application, we just render a form
get '/' do
  multiline "This is a greeting application :)" ,
            '<form action="/greet" method="post">' ,
              'Who would you like to greet?',
              '<input type="text" name="firstname" />' ,
              '<input type="submit" value="Submit" />' ,
            "</form>"
end


# firstname is extracted from the URL
get '/greet/:firstname' do
  greet params[:firstname]
end


# firstname is extracted from parameters that were posted to the server in the form data
post '/greet' do
  greet params[:firstname]
end


# if they go to /greet as a get request (ie through the browser addrss bar)
# we have no way to find the firstname, so we redirect them back to the root url
get '/greet' do
  redirect '/'
end