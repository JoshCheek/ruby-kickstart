# gems
require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-migrations'

# our files
require 'models'
require 'controllers'
require 'helpers'

configure do
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup( :default , ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.sqlite3" )  
  DataMapper.finalize
  DataMapper.auto_upgrade!
end

