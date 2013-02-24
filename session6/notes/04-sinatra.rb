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

