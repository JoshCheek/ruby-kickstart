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
