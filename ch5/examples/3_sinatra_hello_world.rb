require 'rubygems'    # remember, we need to require rubygems before we require any actual gems
require 'sinatra'     # now we loaded the sinatra gem

get '/' do
  "Hello world!"
end