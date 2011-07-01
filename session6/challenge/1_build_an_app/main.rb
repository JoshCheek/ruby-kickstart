require 'sinatra'
require File.dirname(__FILE__)+'/lib/caesar_cipher'

get '/' do
  erb :home
end

post '/encrypt' do
  @decrypted = params[:message]
  @encrypted = CaesarCipher.encrypt @decrypted
  erb :encrypt
end

post '/decrypt' do
  @encrypted = params[:message]
  @decrypted = CaesarCipher.decrypt @encrypted
  erb :decrypt
end
