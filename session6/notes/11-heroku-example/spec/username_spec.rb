require File.dirname(__FILE__) + '/../main'
require 'rack/test'

set :environment, :test

RSpec.describe 'The HelloWorld App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context 'get "/Cheek/Joshua"' do
    before  { get '/Cheek/Joshua' }
    specify { expect(last_response).to be_ok }
    specify { expect(last_response.body).to include "Joshua Cheek's username is jcheek" }
  end

  context 'get "/Cheek/Joshua/Jay"' do
    before  { get '/Cheek/Joshua/Jay' }
    specify { expect(last_response).to be_ok }
    specify { expect(last_response.body).to include "Joshua Jay Cheek's username is jjcheek" }
  end

  context 'get "/Matsumoto/Yukihiro"' do
    before  { get '/Matsumoto/Yukihiro' }
    specify { expect(last_response).to be_ok }
    specify { expect(last_response.body).to include "Yukihiro Matsumoto's username is ymatsu" }
  end
end
