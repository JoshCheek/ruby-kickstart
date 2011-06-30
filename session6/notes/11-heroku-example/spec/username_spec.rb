require File.dirname(__FILE__) + '/../main'
require 'rack/test'

set :environment, :test

describe 'The HelloWorld App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context 'get "/Cheek/Joshua"' do
    before { get '/Cheek/Joshua' }
    specify { last_response.should be_ok }
    specify { last_response.body.should include "Joshua Cheek's username is jcheek" }
  end
  
  context 'get "/Cheek/Joshua/Jay"' do
    before { get '/Cheek/Joshua/Jay' }
    specify { last_response.should be_ok }
    specify { last_response.body.should include "Joshua Jay Cheek's username is jjcheek" }    
  end
  
  context 'get "/Matsumoto/Yukihiro"' do
    before { get '/Matsumoto/Yukihiro' }
    specify { last_response.should be_ok }
    specify { last_response.body.should include "Yukihiro Matsumoto's username is ymatsu" }
  end
  
end
