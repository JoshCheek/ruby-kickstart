require 'rubygems'
require 'sinatra'


get '/greet/:name' do
  "Hello, #{ params[:name].capitalize }, a pleasure to meet you!"
end