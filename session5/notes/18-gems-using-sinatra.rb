# We can require Sinatra just like any other library
# (in Ruby 1.8, you first have to `require "rubygems"`)
require 'sinatra'

# Run this file, then go to "http://localhost:4567/" to try it out.
get '/' do
  "Hello, world!"
end

